import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_dropdown_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_options_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
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
        TitleText(context.intl.titleTextDriverLicenseVerification, color: lightColorScheme.primary),
        LabelText(context.intl.labelTextDriverLicenseInstruction),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          children: [
            LabeledDropdown(
              label: context.intl.labeledDropdownLicenseCategory, 
              colorLabel: lightColorScheme.surface,
              hint: context.intl.labeledDropdownLicenseCategoryHint, 
              onChanged: (value){},
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
            BodyText(context.intl.bodyTextDriverLicensePhoto, color: lightColorScheme.surface),
            SizedBox(height: 20),
            PhotoOptions(
              title: context.intl.photoOptionsFrontTitle, 
              textButtonTake: context.intl.photoOptionsFrontButtonTake, 
              textButtonUpload: context.intl.photoOptionsFrontButtonUpload, 
              onTakePhoto: (){}, 
              onUploadPhoto: (){}
            ),
            SizedBox(height: 40),
            PhotoOptions(
              title: context.intl.photoOptionsBackTitle, 
              textButtonTake: context.intl.photoOptionsFrontButtonTake, 
              textButtonUpload: context.intl.photoOptionsFrontButtonUpload, 
              onTakePhoto: (){}, 
              onUploadPhoto: (){}
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonContinue, 
          onPressed: (){
            appRouter.push('/security/registration_confirmation_person');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: context.intl.secondaryVariantButtonContinueLater, onPressed: (){})
      ],
    );
  }
}