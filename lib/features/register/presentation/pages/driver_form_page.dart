import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/utils/secure_storage_service.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/loading_screen.dart';
import 'package:texi/features/register/presentation/providers/driver_form_provider.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_widget.dart';

/// Esta es la página principal para el formulario de registro de conductores.
///
/// Funciona como un contenedor que estructura la vista general, asegurando que
/// el usuario tenga una experiencia fluida al ingresar sus datos.
/// Extendemos de [ConsumerStatefulWidget] para tener acceso a los "providers" de Riverpod
/// si los necesitamos en el ciclo de vida de esta pantalla.
class DriverFormPage extends ConsumerStatefulWidget {
  const DriverFormPage({super.key});

  @override
  ConsumerState<DriverFormPage> createState() => _DriverFormPageState();
}

class _DriverFormPageState extends ConsumerState<DriverFormPage> {
  @override
  Widget build(BuildContext context) {
    // Observamos el estado del registro. Esto nos permite reaccionar a cambios,
    // por ejemplo, saber si la petición está cargando para mostrar la pantalla de progreso.
    final registerState = ref.watch(driverRegisterProvider);

    // Escuchamos los cambios en el proveedor de registro.
    // 'ref.listen' es ideal para ejecutar "efectos secundarios" (como mostrar SnackBars o navegar),
    // acciones que solo deben ocurrir una vez tras el cambio, sin redibujar la vista completa.
    ref.listen(driverRegisterProvider, (previous, next) {
      next.whenOrNull(
        data: (data) {
          // Si la respuesta de la API es un éxito total:
          if (data?.success == true) {
            // 1. Guardamos los datos recibidos del conductor de forma segura en el dispositivo.
            SecureStorageService().saveDriver(data!.data!);
            // 2. Mostramos un mensaje de confirmación al usuario.
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(customSnackBar(data.message, context));
            // 3. Redirigimos al usuario al siguiente paso: la pantalla de identidad/documentos.
            context.push('/registerHome/identity');
          } else {
            // Si la petición fue exitosa a nivel de red pero la lógica de negocio devolvió un error
            // (por ejemplo: el correo ya existe), lo notificamos en pantalla.
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(customSnackBar(data!.message, context));
          }
        },
        error: (error, stack) {
          // Si ocurrió un error a nivel de servidor, de red o un fallo inesperado:
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar('Error: $error', context));
        },
      );
    });

    // Usamos un Stack como widget principal para poder superponer la pantalla de carga
    // encima de toda la interfaz cuando nuestra solicitud de registro esté en proceso.
    return Stack(
      children: [
        Scaffold(
          // No necesitamos una AppBar estándar aquí, ya que diseñaremos nuestro propio encabezado.
          appBar: null,
          // SafeArea es crucial: evita que nuestro contenido se solape con la barra de estado
          // o el área del "notch" en dispositivos modernos.
          body: SafeArea(
            child: Padding(
              // Añadimos un margen horizontal simétrico.
              // Usamos `5.w` (5% del ancho de la pantalla) gracias a la librería Sizer,
              // lo que hace que el diseño sea responsivo en diferentes tamaños de dispositivo.
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                // Alineamos todo al inicio (arriba y a la izquierda).
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Este widget es el encabezado personalizado.
                  // Muestra el título y una breve descripción para guiar al usuario.
                  // Se usa `.i18n`: esto asegura que los textos se traduzcan
                  // automáticamente según el idioma del dispositivo.
                  DriverFormHeaderWidget(
                    title: personalInformation.i18n,
                    description: formHeaderDescription.i18n,
                  ),

                  // Un pequeño espaciado vertical (2% de la altura de la pantalla).
                  // Esto separa visualmente el encabezado del formulario para que no se vea amontonado.
                  SizedBox(height: 2.h),

                  // Aquí va el corazón de la pantalla: el formulario en sí.
                  // Usamos Expanded para que ocupe todo el espacio vertical sobrante.
                  // SingleChildScrollView permite que el usuario pueda hacer scroll si
                  // el contenido es muy largo o si el teclado virtual tapa algún campo.
                  Expanded(
                    child: SingleChildScrollView(child: DriverFormWidget()),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Si el estado actual es de "carga", mostramos la vista de carga (LoadingScreen).
        // Al usar Positioned.fill ocupará todo el espacio y bloqueará interacciones
        // dobles en el formulario mientras se sube la información.
        if (registerState.isLoading)
          const Positioned.fill(child: LoadingScreen()),
      ],
    );
  }
}
