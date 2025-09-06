import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_options_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/radio_group_row_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/radio_group_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehicleInfoFormView extends HookWidget {
  const VehicleInfoFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Informacion del Vehiculo', color: lightColorScheme.primary),
        LabelText('Por favor ingresa los detalles de tu vehiculo para completar tu registro como conductor TEXI.'),
        SizedBox(height: 20),
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabeledDropdown(
              label: 'Marca del Vehiculo*', 
              colorLabel: lightColorScheme.surface,
              hint: 'Selecciona una marca', 
              items: [
                DropdownMenuItem(
                  value: "Toyota",
                  child: BodyText("Toyota", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "Suzuki",
                  child: BodyText("Suzuki", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "Hyundai",
                  child: BodyText("Hyundai", color: lightColorScheme.surface),
                ),
              ]
            ),
            LabeledTextField(
              label: 'Modelo*', 
              colorLabel: lightColorScheme.surface,
              hint: 'Ej. Corolla Civic, Sentra'
            ),
            LabeledDropdown(
              label: 'Año*', 
              colorLabel: lightColorScheme.surface,
              hint: 'Selecciona el año', 
              items: [
                DropdownMenuItem(
                  value: "2018",
                  child: BodyText("2018", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "2019",
                  child: BodyText("2019", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "2020",
                  child: BodyText("2020", color: lightColorScheme.surface),
                ),
              ]
            ),
            LabeledTextField(
              label: 'Numero de Placa*', 
              colorLabel: lightColorScheme.surface,
              hint: 'Ej. ABC-123'
            ),
            RadioGroup(
              label: 'Color*',
              colorLabel: lightColorScheme.surface,
              options: ["Blanco", "Negro", "Gris", "Rojo", "Azul", "Verde", "Plata", "Otro"],
            ),
            RadioGroupRow(
              label: 'Tipo de Vehiculo',
              colorLabel: lightColorScheme.surface,
              options: ["Sedan", "SUV", "Hatchback"],
            ),
            SizedBox(height: 20),
            BodyText(
              'Tarjeta de Propiedad del Vehiculo',
              color: lightColorScheme.surface,
            ),
            SizedBox(height: 40),
            PhotoOptions(
              title: 'Documento de propiedad', 
              textButtonTake: 'Subir foto', 
              textButtonUpload: 'Usar camara', 
              onTakePhoto: (){}, 
              onUploadPhoto: (){}
            ),
            SizedBox(height: 20),
            LabelText('Confirmo que la informacion proporcionada es correcta', color: lightColorScheme.surface, textAlign: TextAlign.center)
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          backgroundColor: lightColorScheme.surfaceBright,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info, color: lightColorScheme.surfaceVariant),
                SizedBox(width: 20),
                Expanded(
                  child: 
                    LabelText('Asegurese de que los datos ingresador coincidan con los documentos oficiales del vehiculo para evitar problemas durante la verificacion',
                    color: lightColorScheme.surface)
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Continuar', 
          onPressed: (){
            appRouter.push('/security/vehicle_photo_registration');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: 'Continuar Despues', onPressed: (){})
      ],
    );
  }
}