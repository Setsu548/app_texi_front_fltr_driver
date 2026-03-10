import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_user/driver_form_widget.dart';

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
    // Usamos un Stack como widget principal para poder superponer la pantalla de carga
    // encima de toda la interfaz cuando nuestra solicitud de registro esté en proceso.
    return Scaffold(
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
              Expanded(child: SingleChildScrollView(child: DriverFormWidget())),
            ],
          ),
        ),
      ),
    );
  }
}
