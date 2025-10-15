import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
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
        TitleText(context.intl.titleTextPersonalInfo, color: lightColorScheme.primary),
        LabelText(context.intl.labelTextEnterPersonalData),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabeledTextField(
              label: context.intl.labeledTextFieldFirstName,
              colorLabel: lightColorScheme.surface, 
              hint: context.intl.labeledTextFieldFirstNameHint
            ),
            LabeledTextField(
              label: context.intl.labeledTextFieldLastName,
              colorLabel: lightColorScheme.surface, 
              hint: context.intl.labeledTextFieldLastNameHint
            ),
            LabeledTextField(
              label: context.intl.labeledTextFieldPhoneNumber,
              colorLabel: lightColorScheme.surface, 
              hint: '77777777',
              prefixText: '+591',
              colorPrefix: lightColorScheme.surface,
            ),
            LabeledTextField(
              label: context.intl.labeledTextFieldAddress,
              colorLabel: lightColorScheme.surface, 
              hint: context.intl.labeledTextFieldAddressHint
            ),
            LabeledDropdown(
              label: context.intl.labeledDropdownDepartment, 
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledDropdownDepartmentHint, 
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
              label: context.intl.labeledDropdownProvince, 
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledDropdownProvinceHint, 
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
              label: context.intl.labeledTextFieldEmail,
              colorLabel: lightColorScheme.surface, 
              hint: context.intl.labeledTextFieldEmailHint
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonContinue, 
          onPressed: (){
            appRouter.push('/security/identity_verification');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: context.intl.secondaryVariantButtonCancel, onPressed: (){})
      ],
    );
  }
}