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
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
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
        TitleText(context.intl.titleTextVehicleInfo, color: lightColorScheme.primary),
        LabelText(context.intl.labelTextEnterVehicleData),
        SizedBox(height: 20),
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.center,
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabeledDropdown(
              label: context.intl.labeledDropdownVehicleBrand, 
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledDropdownVehicleBrandHint, 
              onChanged: (value){},
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
              label: context.intl.labeledTextFieldVehicleModel, 
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledTextFieldVehicleModelHint
            ),
            LabeledDropdown(
              label: context.intl.labeledDropdownVehicleYear, 
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledDropdownVehicleYearHint, 
              onChanged: (value){},
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
              label: context.intl.labeledTextFieldVehiclePlate, 
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledTextFieldVehiclePlateHint
            ),
            RadioGroup(
              label: context.intl.radioGroupVehicleColor,
              colorLabel: lightColorScheme.surface,
              options: ["Blanco", "Negro", "Gris", "Rojo", "Azul", "Verde", "Plata", "Otro"],
            ),
            RadioGroupRow(
              label: context.intl.radioGroupVehicleType,
              colorLabel: lightColorScheme.surface,
              options: ["Sedan", "SUV", "Hatchback"],
            ),
            SizedBox(height: 20),
            BodyText(
              context.intl.bodyTextVehicleOwnership,
              color: lightColorScheme.surface,
            ),
            SizedBox(height: 40),
            PhotoOptions(
              title: context.intl.photoOptionsVehicleDocumentTitle, 
              textButtonTake: context.intl.photoOptionsVehicleDocumentButtonTake, 
              textButtonUpload: context.intl.photoOptionsVehicleDocumentButtonUpload, 
              onTakePhoto: (){}, 
              onUploadPhoto: (){}
            ),
            SizedBox(height: 20),
            LabelText(context.intl.labelTextConfirmVehicleData, color: lightColorScheme.surface, textAlign: TextAlign.center)
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
                    LabelText(context.intl.bodyTextVehicleInfoNotice,
                    color: lightColorScheme.surface)
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonContinue, 
          onPressed: (){
            appRouter.push('/security/vehicle_photo_registration');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: context.intl.secondaryVariantButtonContinueLater, onPressed: (){})
      ],
    );
  }
}