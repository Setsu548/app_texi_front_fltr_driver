import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_picker_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehiclePhotoRegistrationView extends HookWidget {
  const VehiclePhotoRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Fotografias del Vehiculo', color: lightColorScheme.primary),
        SizedBox(height: 20),
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.start,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabelText(
              'Para completar el registro, necesitamos fotos claras de los cuatro lados de su vehiculo',
              color: lightColorScheme.surface,
            ),
            SizedBox(height: 20),
            CardPrimaryContainer(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info, color: lightColorScheme.surfaceVariant),
                    SizedBox(width: 20),
                    Expanded(
                      child: 
                        LabelText('Asegurese de tomar las fotos con buena ilumincacion y que se vea claramente todo el vehiculo en cada toma.',
                        color: lightColorScheme.surface)
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            BodyText('1. Frente del vehiculo', color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: 'Toque para tomar la foto', onTap: (){}),
            SizedBox(height: 20),
            BodyText('2. Latertal izquierdo', color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: 'Toque para tomar la foto', onTap: (){}),
            SizedBox(height: 20),
            BodyText('3. Latertal Derecho', color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: 'Toque para tomar la foto', onTap: (){}),
            SizedBox(height: 20),
            BodyText('4. Parte trasera', color: lightColorScheme.secondary),
            SizedBox(height: 20),
            PhotoPickerField(label: 'Toque para tomar la foto', onTap: (){})
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Continuar', 
          onPressed: (){
            appRouter.push('/security/registration_confirmation_vehicle');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: 'Continuar Despues',
          onPressed: (){}
        )
      ],
    );
  }
}