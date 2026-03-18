import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:texi_driver/core/utils/google_directions_service.dart';
import 'package:texi_driver/features/trips_driver/domain/entities/location_entity.dart';
import 'package:texi_driver/features/trips_driver/presentation/providers/trip_offers_provider.dart';

// ── Estado que expone la página ──────────────────────────────────────────────
class RouteState {
  final LatLng? driverPosition;
  final Set<Polyline> polylines;
  final Set<Marker> markers;
  final bool isLoading;

  const RouteState({
    this.driverPosition,
    this.polylines = const {},
    this.markers = const {},
    this.isLoading = true,
  });

  RouteState copyWith({
    LatLng? driverPosition,
    Set<Polyline>? polylines,
    Set<Marker>? markers,
    bool? isLoading,
  }) {
    return RouteState(
      driverPosition: driverPosition ?? this.driverPosition,
      polylines: polylines ?? this.polylines,
      markers: markers ?? this.markers,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

// ── Notifier ─────────────────────────────────────────────────────────────────
class RouteNotifier extends Notifier<RouteState> {
  Timer? _timer;

  @override
  RouteState build() {
    // Observa reactivamente el destino. Cuando arriveTrip cambie el destinyProvider,
    // Riverpod reconstruirá este notifier, el onDispose cancelará el timer anterior
    // y se arrancará un nuevo ciclo de tracking hacia el nuevo destino.
    final destination = ref.watch(destinyProvider);

    // Cancela el timer cuando el provider sea destruido o reconstruido.
    ref.onDispose(() => _timer?.cancel());

    // Arrancar tracking en el próximo frame para no mutar estado durante build.
    Future.microtask(() => _startTracking(destination));

    return const RouteState();
  }

  /// Inicia el seguimiento de ruta hacia [destination].
  Future<void> _startTracking(LocationEntity destination) async {
    // Primer update inmediato.
    await _updateRoute(destination);

    // Refresca la ruta cada 5 segundos para suavidad máxima sin abusar la API.
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      _updateRoute(destination);
    });
  }

  Future<void> _updateRoute(LocationEntity destination) async {
    try {
      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      final driverLatLng = LatLng(position.latitude, position.longitude);
      final destLatLng = LatLng(destination.lat, destination.lng);

      final points = await GoogleDirectionsService.getRoutePolyline(
        driverLatLng,
        destLatLng,
      );

      state = state.copyWith(
        driverPosition: driverLatLng,
        isLoading: false,
        polylines: {
          Polyline(
            polylineId: const PolylineId('route'),
            points: points,
            color: Colors.blue,
            width: 5,
            jointType: JointType.round,
            startCap: Cap.roundCap,
            endCap: Cap.roundCap,
          ),
        },
        markers: {
          Marker(
            markerId: const MarkerId('driver'),
            position: driverLatLng,
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueAzure,
            ),
            infoWindow: const InfoWindow(title: 'Mi ubicación'),
          ),
          Marker(
            markerId: const MarkerId('destination'),
            position: destLatLng,
            infoWindow: const InfoWindow(title: 'Destino'),
          ),
        },
      );
    } catch (e) {
      debugPrint('[RouteNotifier] Error al actualizar ruta: $e');
      // Si falla, solo quita el loading para no bloquear la UI.
      if (state.isLoading) {
        state = state.copyWith(isLoading: false);
      }
    }
  }
}

// ── Provider ─────────────────────────────────────────────────────────────────

/// Provider con autoDispose para que el timer se cancele automáticamente
/// cuando el widget que lo observa desaparece de la pantalla.
final routeProvider = NotifierProvider.autoDispose<RouteNotifier, RouteState>(
  RouteNotifier.new,
);
