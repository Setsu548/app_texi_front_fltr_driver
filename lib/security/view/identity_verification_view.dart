import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_capture_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IdentityVerificationView extends HookWidget {
  const IdentityVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Verificacion de Identidad', color: lightColorScheme.primary),
        LabelText('Por favor ingrese su numero de identificacion y suba las imagenes requeridad para verificar su identidad'),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LabeledTextField(
              label: 'Numero de Identificacion*',
              colorLabel: lightColorScheme.surface, 
              hint: 'Ingrese su numero de identificacion'
            ),
            LabelText('Ingrese su numero que aparece en su documento de identidad', color: lightColorScheme.surface),
            SizedBox(height: 20),
            BodyText('Foto del Documento de Identidad', color: lightColorScheme.surface),
            SizedBox(height: 40),
            PhotoCaptureField(
              title: 'Parte frontal del documento',
              description: 'Asegurese de que toda la informacion sea visible',
              textButton: 'Tomar Foto',
              onPressed: () {},
            ),
            SizedBox(height: 40),
            PhotoCaptureField(
              title: 'Parte trasera del documento',
              description: 'Asegurese de que toda la informacion sea visible',
              textButton: 'Tomar Foto',
              onPressed: () {},
            ),
            SizedBox(height: 40),
            PhotoCaptureField(
              title: "Foto para su perfil",
              description: "Tome una foto clara de tu rostro",
              textButton: "Tomar Foto",
              onPressed: () {},
              icon: Icons.person,
              iconColor: lightColorScheme.secondaryContainer,
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Continuar', 
          onPressed: (){
            appRouter.push('/security/driver_license_verification');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: 'Continuar Despues', onPressed: (){})
      ],
    );
  }
}