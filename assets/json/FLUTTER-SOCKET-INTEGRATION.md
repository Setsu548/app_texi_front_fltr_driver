# Integración Socket.IO para Desarrolladores Flutter

Guía para que las aplicaciones Flutter (conductor, pasajero, panel admin) se conecten al backend de GPS Tracking vía WebSocket y gestionen la data correctamente.

---

## 1. Resumen del Sistema

| Componente      | Función                                                                 |
|-----------------|-------------------------------------------------------------------------|
| **gps-ingestion** | Servidor Socket.IO que recibe ubicaciones GPS, valida JWT y persiste en Redis |
| **gps-worker**    | Proceso que lee de Redis Stream y persiste en PostgreSQL               |
| **Redis**         | Caché en tiempo real (GeoHash) + cola de eventos (Stream)              |
| **PostgreSQL**    | Persistencia definitiva de ubicaciones                                 |

**Flujo de datos:**

```
App Flutter (conductor)  --location:update-->  Socket.IO  -->  Redis Stream
                                                      -->  Redis GeoHash (consulta en vivo)
                                                      -->  Worker --> PostgreSQL
```

---

## 2. Dependencias Flutter

```yaml
# pubspec.yaml
dependencies:
  socket_io_client: ^2.0.3+1
```

O si usas el paquete específico para Flutter (WebSocket nativo):

```yaml
dependencies:
  socket_io_client_flutter: ^2.0.3
```

---

## 3. Conexión y Autenticación

### 3.1 URL base

- **Desarrollo:** `http://localhost:3000` o `http://<IP>:3000`
- **Producción:** `https://api.tudominio.com`
- **Path Socket.IO:** `/socket.io/` (por defecto)

### 3.2 Token JWT

El servidor exige un JWT válido en cada conexión. El token debe incluir al menos:

```json
{
  "uuid": "a08e85f8-8007-4fdb-b4bb-691b98b81f50",
  "username": "+59177777777",
  "exp": 1772927259
}
```

- **uuid**: identificador del usuario en tu base (se usa para buscar el ID numérico en `public.users`)
- **exp**: fecha de expiración en Unix timestamp

### 3.3 Código de conexión (Flutter)

```dart
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GpsSocketService {
  IO.Socket? _socket;
  final String baseUrl;
  final String jwtToken;

  GpsSocketService({required this.baseUrl, required this.jwtToken});

  void connect() {
    _socket = IO.io(
      baseUrl,
      IO.OptionBuilder()
        .setTransports(['websocket', 'polling'])
        .setAuth({'token': jwtToken})  // El servidor lee handshake.auth.token
        .enableAutoConnect()
        .enableReconnection()
        .setReconnectionAttempts(5)
        .setReconnectionDelay(1000)
        .setReconnectionDelayMax(5000)
        .setTimeout(20000)
        .build(),
    );

    _socket!.onConnect((_) {
      print('Conectado al servidor GPS');
    });

    _socket!.onConnectError((err) {
      print('Error de conexión: $err');
    });

    _socket!.onDisconnect((reason) {
      print('Desconectado: $reason');
    });

    _socket!.connect();
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }

  IO.Socket? get socket => _socket;
}
```

### 3.4 Actualizar token en reconexión

Si el JWT expira, hay que crear un nuevo socket con el token nuevo. No sirve actualizar opciones del socket existente:

```dart
void reconnectWithNewToken(String newToken) {
  disconnect();
  jwtToken = newToken;
  connect();
}
```

---

## 3.5 `connection:ack` (Servidor → Cliente)

Tras conectar con JWT válido, el servidor envía **una vez** el contexto del conductor (perfil, disponibilidad, wallet, viaje activo). Escuchar **antes** o justo después de `connect`:

```dart
_socket!.on('connection:ack', (data) {
  final map = data as Map<String, dynamic>?;
  if (map?['ok'] == true) {
    // profile, status.availability, wallet, hasActiveTrip, activeTrip
  }
});
```

Payload exitoso (resumen):

| Campo | Descripción |
|-------|-------------|
| `profile` | `driverId`, `uuid`, `userName`, `vehicle` (brand, model, licensePlate, …) |
| `status` | `isOnline`, `availability` (`available` \| `busy` \| `on_break`), `lastPing` |
| `wallet` | `balance`, `currency`, `isActive` o `null` si no existe fila en billing |
| `hasActiveTrip` | `true` si hay viaje en curso (operations.trips) |
| `activeTrip` | `{ tripId, status }` o `null` |

Si hay timeout o error de DB, `ok: false` con `code` (`TIMEOUT`, `ERROR`, …) y payload mínimo para que la app no quede bloqueada.

---

## 3.6 `driver:setAvailability` (Cliente → Servidor)

Cambiar disponibilidad para matching (solo `available` debería recibir ofertas).

```dart
// Con callback ack (recomendado)
_socket!.emitWithAck('driver:setAvailability', {'availability': 'busy'}, ack: (data) {
  if (data['ok'] == true) { /* actualizado */ }
});

// O emit simple y escuchar driver:availability_ack / driver:availability_error
_socket!.emit('driver:setAvailability', {'availability': 'on_break'});
```

Valores: `available`, `busy`, `on_break`. Rate limit en servidor: **máx. 1 cambio cada 2 s** por conductor (`RATE_LIMITED` si se excede).

---

## 4. Eventos Emitidos por la App (Cliente → Servidor)

### 4.1 `location:update` (GPS)

Envía la ubicación actual del conductor.

**Payload (objeto JSON):**

```json
{
  "lat": -17.3935,
  "lng": -66.157,
  "bearing": 45,
  "speed": 10
}
```

| Campo    | Tipo   | Obligatorio | Descripción                          |
|----------|--------|-------------|--------------------------------------|
| `lat`    | number | Sí          | Latitud (-90 a 90)                   |
| `lng`    | number | Sí          | Longitud (-180 a 180)                |
| `bearing`| number | No          | Orientación en grados (0–360)        |
| `speed`  | number | No          | Velocidad (km/h)                     |

**Ejemplo Flutter:**

```dart
void sendLocation(double lat, double lng, {double bearing = 0, double speed = 0}) {
  _socket?.emit('location:update', {
    'lat': lat,
    'lng': lng,
    'bearing': bearing,
    'speed': speed,
  });
}
```

**Frecuencia recomendada:** 1–5 segundos en movimiento, 10–30 s en parado. Evitar < 1 s para ahorrar batería y datos.

---

### 4.2 `trip:accept` (opcional)

Aceptar una carrera ofrecida. Requiere que exista `trips.service.js`.

```dart
void acceptTrip(String tripId) {
  _socket?.emit('trip:accept', {'tripId': tripId});
}
```

### 4.3 `trip:reject` (opcional)

Rechazar una oferta de carrera.

```dart
void rejectTrip(String tripId) {
  _socket?.emit('trip:reject', {'tripId': tripId});
}
```

---

## 5. Eventos Recibidos por la App (Servidor → Cliente)

### 5.1 `connection:ack`

Ver sección 3.5.

### 5.2 `pong` / ack de `ping`

Heartbeat: cliente envía `ping` con `{ t: millis }`; servidor responde con `pong` o callback con `{ pong: true, t }`.

### 5.3 `driver:availability_ack` / `driver:availability_error`

Respuesta a `driver:setAvailability` si no se usa callback.

### 5.4 `location:ack`

Confirmación de que la ubicación se procesó correctamente.

```json
{"success": true, "t": 1773100519123}
```

```dart
_socket?.on('location:ack', (data) {
  final ack = data as Map<String, dynamic>?;
  if (ack?['success'] == true) {
    // Ubicación guardada correctamente
  }
});
```

### 5.5 `gps:error`

Error al procesar una ubicación.

```json
{
  "message": "lat y lng son requeridos",
  "code": "MISSING_COORDINATES"
}
```

**Códigos posibles:**

| Código                 | Descripción                                  |
|------------------------|----------------------------------------------|
| `INVALID_PAYLOAD`      | Payload vacío o JSON inválido                |
| `MISSING_COORDINATES`  | Faltan lat o lng                             |
| `INVALID_COORDINATES`  | lat/lng fuera de rango o no numéricos        |
| `INTERNAL_SERVER_ERROR`| Error interno del servidor                   |

```dart
_socket?.on('gps:error', (data) {
  final err = data as Map<String, dynamic>?;
  final code = err?['code'] as String?;
  final message = err?['message'] as String?;
  // Mostrar mensaje o reintentar
});
```

### 5.6 `trip:offer` (Servidor → Conductor)

Cuando un pasajero crea un viaje con `POST /passengers/trips`, el backend genera hasta 3 ofertas y envía **una** oferta a cada conductor elegido por WebSocket. El conductor debe escuchar este evento para mostrar la carrera en pantalla y permitir aceptar o rechazar.

**Payload (objeto JSON):**

```json
{
  "tripId": "a1b2c3d4-e5f6-7890-abcd-ef1234567890",
  "offeredPrice": 15.5,
  "etaMinutes": 5
}
```

| Campo          | Tipo    | Descripción                                      |
|----------------|---------|--------------------------------------------------|
| `tripId`       | string  | UUID del viaje en `operations.trips`            |
| `offeredPrice` | number  | Precio ofertado (puede ser `null`)               |
| `etaMinutes`   | number  | Minutos estimados de llegada al punto de recogida |

**Ejemplo Flutter:**

```dart
_socket?.on('trip:offer', (data) {
  final map = data as Map<String, dynamic>?;
  if (map == null) return;
  final tripId = map['tripId'] as String?;
  final offeredPrice = map['offeredPrice'] as num?;
  final etaMinutes = map['etaMinutes'] as int?;
  // Mostrar pantalla de oferta: precio, ETA, botones Aceptar / Rechazar
  // Aceptar: emit('trip:accept', {'tripId': tripId})
  // Rechazar: emit('trip:reject', {'tripId': tripId})
});
```

La oferta expira en **30 segundos** en el servidor; si el conductor no responde a tiempo, recibirá `trip:error` con código `OFFER_EXPIRED` si intenta aceptar después.

---

### 5.7 `trip:accepted` / `trip:rejected` / `trip:error`

Respuestas a `trip:accept` y `trip:reject`.

---

## 6. Errores de Conexión / Autenticación

Si la conexión falla por autenticación, el servidor cierra la conexión. Posibles motivos:

| Error del servidor  | Causa                                    |
|---------------------|------------------------------------------|
| `AUTH_REQUIRED`     | No se envió token                        |
| `UNAUTHORIZED`      | Token inválido o mal firmado             |
| `AUTH_FAILED`       | Token expirado u otro error de verificación |
| `DRIVER_NOT_FOUND`  | uuid no existe en `public.users`         |
| `INACTIVE_DRIVER`   | Conductor inactivo en la base de datos   |

---

## 7. Buenas Prácticas para Móvil

### 7.1 Reconexión

- Usar `enableReconnection()` del cliente.
- Detectar cuando el token expira y reconectar con uno nuevo.
- Tras reconexión, re-enviar la ubicación actual.

### 7.2 Uso de batería

- En segundo plano, reducir frecuencia o pausar envíos.
- Usar `Geolocator.getPositionStream()` con intervalos razonables (p. ej. 5 s).

### 7.3 Manejo de red

- Suspender envío si no hay conexión (ej. `connectivity_plus`).
- Opcional: cola local y reintentos para ubicaciones no enviadas.

### 7.4 Desconexión al cerrar sesión

```dart
void logout() {
  sendLocation(0, 0);  // Opcional: última ubicación
  disconnect();
}
```

---

## 8. Ejemplo Completo de Servicio

```dart
import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class GpsTrackingService {
  IO.Socket? _socket;
  final String baseUrl;
  String _jwtToken;
  StreamSubscription? _locationSubscription;

  GpsTrackingService({
    required this.baseUrl,
    required String jwtToken,
  }) : _jwtToken = jwtToken;

  void connect() {
    _socket = IO.io(
      baseUrl,
      IO.OptionBuilder()
        .setTransports(['websocket', 'polling'])
        .setAuth({'token': _jwtToken})
        .enableReconnection()
        .setReconnectionAttempts(10)
        .setReconnectionDelay(1000)
        .setTimeout(20000)
        .build(),
    );

    _socket!.onConnect((_) {
      print('[GPS] Conectado');
    });

    _socket!.on('location:ack', (data) {
      // Ubicación confirmada
    });

    _socket!.on('gps:error', (data) {
      print('[GPS] Error: $data');
    });

    _socket!.onConnectError((err) {
      print('[GPS] Error conexión: $err');
    });

    _socket!.connect();
  }

  void startSendingLocation(Stream<Position> locationStream) {
    _locationSubscription = locationStream.listen((position) {
      _socket?.emit('location:update', {
        'lat': position.latitude,
        'lng': position.longitude,
        'bearing': position.heading,
        'speed': position.speed * 3.6, // m/s -> km/h
      });
    });
  }

  void stopSendingLocation() {
    _locationSubscription?.cancel();
  }

  void updateToken(String newToken) {
    _jwtToken = newToken;
    disconnect();
    connect();
  }

  void disconnect() {
    stopSendingLocation();
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }
}
```

---

## 9. API REST para conductores (complementaria al WebSocket)

**No sustituye al WebSocket.** La app de conductor debe usar **WebSocket** para: recibir `connection:ack` y `trip:offer`, enviar `location:update`, `trip:accept`/`trip:reject` y `driver:setAvailability`. Sin WebSocket conectado, el conductor no recibe ofertas ni puede reportar ubicación en tiempo real.

La API REST siguiente expone **los mismos datos** (perfil, estado, ubicación, wallet, viajes) por HTTP. Sirve para:
- Refrescar pantalla o consultar datos sin depender del socket (ej. al abrir la app o en pantallas de “Mi perfil”).
- Probar con Postman/Swagger sin levantar un cliente Socket.IO.

| Método | Ruta | Descripción |
|--------|------|-------------|
| GET | `/drivers/me` | Perfil (usuario + vehículo) |
| GET | `/drivers/me/status` | is_online, availability |
| GET | `/drivers/me/location` | Ubicación actual |
| GET | `/drivers/me/wallet` | Saldo de billetera |
| GET | `/drivers/me/trips` | Viajes (query: limit, offset, status) |
| POST | `/drivers/me/trips/{tripId}/accept` | Aceptar oferta (alternativa a emitir `trip:accept`) |
| POST | `/drivers/me/trips/{tripId}/reject` | Rechazar oferta (alternativa a emitir `trip:reject`) |

**Autenticación:** `Authorization: Bearer <JWT>`. El JWT debe incluir `uuid` (o `driverId`) del conductor.

Documentación completa en **http://localhost:3000/docs** (Swagger).

---

## 10. Endpoints HTTP Útiles

| Ruta       | Método | Descripción              |
|------------|--------|---------------------------|
| `/health`  | GET    | Estado del servidor       |
| `/ready`   | GET    | Readiness para orquestador|
| `/docs`    | GET    | Swagger (solo desarrollo) |

---

## 11. Variables de Entorno del Servidor

Para pruebas locales, el backend necesita por ejemplo:

```env
NODE_ENV=development
PORT=3000
JWT_SECRET=tu_secreto_compartido
REDIS_URL=redis://localhost:6379
DB_HOST=localhost
DB_PORT=5432
DB_NAME=tu_db
DB_USER=usuario
DB_PASSWORD=password
CORS_ORIGIN=*
```

En producción, configura `CORS_ORIGIN` con los orígenes permitidos y un `JWT_SECRET` de al menos 32 caracteres.
