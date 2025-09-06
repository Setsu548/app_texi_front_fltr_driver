import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PersonalInfoFormView extends HookWidget {
  const PersonalInfoFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText('Informacion Personal', color: lightColorScheme.primary),
        LabelText('Por favor ingresa tus datos personales'),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabeledTextField(
              label: 'Nombres*',
              colorLabel: lightColorScheme.surface, 
              hint: 'Ej. Juan Diego'
            ),
            LabeledTextField(
              label: 'Apellidos*',
              colorLabel: lightColorScheme.surface, 
              hint: 'Ej. Dias Soto'
            ),
            LabeledTextField(
              label: 'Numero de Telefono*',
              colorLabel: lightColorScheme.surface, 
              hint: '77777777',
              prefixText: '+591',
              colorPrefix: lightColorScheme.surface,
            ),
            LabeledTextField(
              label: 'Direccion*',
              colorLabel: lightColorScheme.surface, 
              hint: 'Calle, numero, barrio'
            ),
            LabeledDropdown(
              label: 'Departamento*', 
              colorLabel: lightColorScheme.surface,
              hint: 'Selecciona tu departamento', 
              items: [
                DropdownMenuItem(
                  value: "Cochabamba",
                  child: BodyText("Cochabamba", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "La Paz",
                  child: BodyText("La Paz", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "Santa Cruz",
                  child: BodyText("Santa Cruz", color: lightColorScheme.surface),
                ),
              ]
            ),
            LabeledDropdown(
              label: 'Provincia*', 
              colorLabel: lightColorScheme.surface,
              hint: 'Selecciona tu provincia', 
              items: [
                DropdownMenuItem(
                  value: "Cercado",
                  child: BodyText("Cercado", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "Capinota",
                  child: BodyText("Capinota", color: lightColorScheme.surface),
                ),
                DropdownMenuItem(
                  value: "Punata",
                  child: BodyText("Punata", color: lightColorScheme.surface),
                ),
              ]
            ),
            LabeledTextField(
              label: 'Correo Electronico*',
              colorLabel: lightColorScheme.surface, 
              hint: 'ejemplo@correo.com'
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: 'Continuar', 
          onPressed: (){
            appRouter.push('/security/identity_verification');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: 'Cancelar', onPressed: (){})
      ],
    );
  }
}