import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_options_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverLicenseVerificationView extends HookWidget {
  const DriverLicenseVerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Verificacion de Licencia', color: lightColorScheme.primary),
        LabelText('Por favor sube las imagenes de tu documento para verificar tu licencia'),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabeledDropdown(
              label: 'Categoria de Licencia', 
              colorLabel: lightColorScheme.surface,
              hint: 'Seleccionar categoria', 
              items: [
                DropdownMenuItem(
                  value: 'Categoría "A"',
                  child: BodyText('Categoría "A"', color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: 'Categoría "B"',
                  child: BodyText('Categoría "B"', color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: 'Categoría "C"',
                  child: BodyText('Categoría "C"', color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: 'Categoría "C1"',
                  child: BodyText('Categoría "C1"', color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: 'Categoría "P"',
                  child: BodyText('Categoría "P"', color: lightColorScheme.surface),
                ),
              ]
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BodyText('Foto de Licencia de Conducir', color: lightColorScheme.surface),
            SizedBox(height: 20),
            PhotoOptions(
              title: 'Lado Frontal', 
              textButtonTake: 'Subir foto', 
              textButtonUpload: 'Usar camara', 
              onTakePhoto: (){}, 
              onUploadPhoto: (){}
            ),
            SizedBox(height: 40),
            PhotoOptions(
              title: 'Lado Posterior', 
              textButtonTake: 'Subir foto', 
              textButtonUpload: 'Usar camara', 
              onTakePhoto: (){}, 
              onUploadPhoto: (){}
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Continuar', 
          onPressed: (){
            appRouter.push('/security/registration_confirmation_person');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: 'Continuar Despues', onPressed: (){})
      ],
    );
  }
}