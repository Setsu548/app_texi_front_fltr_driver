import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_back_identification_section.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_front_identification_section.dart';
import 'package:texi/features/register/presentation/widgets/driver_identity_iput.dart';
import 'package:texi/features/register/presentation/widgets/driver_profile_image_section.dart';

/// [DriverIdentityPage]
///
/// Esta página es responsable de la pantalla de verificación de identidad del conductor
/// dentro del flujo de registro.
///
/// Su propósito principal es permitir al usuario capturar y subir los documentos
/// necesarios para validar su identidad, tales como:
/// - Documento de identidad (DNI/Cédula).
/// - Fotos del documento (frente y reverso).
/// - Foto de perfil del conductor.
///
/// Hereda de [StatefulWidget] ya que maneja un estado interno para los controladores
/// de texto y la gestión de la interacción del usuario.
class DriverIdentityPage extends StatefulWidget {
  const DriverIdentityPage({super.key});

  @override
  State<DriverIdentityPage> createState() => _DriverIdentityPageState();
}

/// [_DriverIdentityPageState]
///
/// Clase de estado para [DriverIdentityPage].
///
/// Administra:
/// - El controlador [_identityController] para el campo de entrada del documento de identidad.
/// - La construcción de la interfaz gráfica de usuario (UI).
class _DriverIdentityPageState extends State<DriverIdentityPage> {
  /// Controlador para manejar el texto ingresado en el campo de documento de identidad.
  final _identityController = TextEditingController();

  /// Construye la estructura visual de la página.
  ///
  /// Retorna un [Scaffold] que contiene un [SingleChildScrollView] para permitir
  /// el desplazamiento en pantallas pequeñas.
  ///
  /// La estructura principal es una [Column] que organiza los elementos verticalmente:
  /// 1. [DriverFormHeaderWidget]: Encabezado con título y descripción.
  /// 2. [DriverIdentityInput]: Campo para ingresar el número de documento.
  /// 3. Secciones para subir fotos del documento (frente y reverso) usando [DottedBorder] para resaltar el área de carga.
  /// 4. [DriverProfileImageSection]: Sección para subir la foto de perfil.
  /// 5. Botones de navegación para continuar o guardar el progreso.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // No se utiliza AppBar por defecto en esta pantalla.
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Encabezado de la sección de verificación de identidad.
              DriverFormHeaderWidget(
                title: identityVerification.i18n,
                description: identityVerificationDescription.i18n,
              ),
              SizedBox(height: 2.h),

              // Contenedor para el campo de entrada del documento de identidad.
              Container(
                width: 90.w,
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 5.sp,
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withValues(alpha: 0.5),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Widget personalizado para el input del documento de identidad.
                    DriverIdentityInput(controller: _identityController),
                  ],
                ),
              ),
              SizedBox(height: 2.h),

              // Sección para la foto FRONTAL del documento de identidad.
              // Utiliza DottedBorder para indicar visualmente que es una zona de carga/captura.
              DottedBorder(
                options: RectDottedBorderOptions(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  dashPattern: [8, 4],
                  strokeWidth: 5.sp,
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.5),
                ),
                child: SizedBox(
                  width: 80.w,
                  // Widget que maneja la lógica y UI para la foto frontal.
                  child: DriverFrontIdentificationSection(),
                ),
              ),
              SizedBox(height: 2.h),

              // Sección para la foto TRASERA del documento de identidad.
              DottedBorder(
                options: RectDottedBorderOptions(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  dashPattern: [8, 4],
                  strokeWidth: 5.sp,
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.5),
                ),
                child: SizedBox(
                  width: 80.w,
                  // Widget que maneja la lógica y UI para la foto trasera.
                  child: DriverBackIdentificationSection(),
                ),
              ),
              SizedBox(height: 2.h),

              // Sección para la foto de PERFIL del conductor.
              DottedBorder(
                options: RectDottedBorderOptions(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  dashPattern: [8, 4],
                  strokeWidth: 5.sp,
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.5),
                ),
                child: SizedBox(
                  width: 80.w,
                  // Widget que maneja la lógica y UI para la foto de perfil.
                  child: DriverProfileImageSection(),
                ),
              ),
              SizedBox(height: 2.h),

              // Botón principal para continuar al siguiente paso (Licencia de conducir).
              ElevatedButtonWidget(
                onPressed: () {
                  // Navega a la ruta de registro de licencia.
                  context.go('/registerHome/license');
                },
                label: continueButton.i18n,
                iconImageAfter: Icon(Icons.chevron_right),
              ),
              SizedBox(height: 2.h),

              // Botón secundario para pausar el registro y continuar después.
              AnotherElevatedButtonWidget(
                label: continueLater.i18n,
                onPressed: () {
                  // TODO: Implementar lógica para guardar borrador o salir.
                },
              ),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
