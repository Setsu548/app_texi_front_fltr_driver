import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/photo_capture_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
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
        TitleText(context.intl.titleTextIdentityVerification, color: lightColorScheme.primary),
        LabelText(context.intl.labelTextIdentityInstruction),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LabeledTextField(
              label: context.intl.labeledTextFieldIdNumber,
              colorLabel: lightColorScheme.surface, 
              hint: context.intl.labeledTextFieldIdNumberHint
            ),
            LabelText(context.intl.labelTextIdNumberInfo, color: lightColorScheme.surface),
            SizedBox(height: 20),
            BodyText(context.intl.bodyTextIdPhoto, color: lightColorScheme.surface),
            SizedBox(height: 40),
            PhotoCaptureField(
              title: context.intl.photoCaptureFrontDocumentTitle,
              description: context.intl.photoCaptureFrontDocumentDescription,
              textButton: context.intl.photoCaptureProfileButton,
              onPressed: () {},
            ),
            SizedBox(height: 40),
            PhotoCaptureField(
              title: context.intl.photoCaptureBackDocumentTitle,
              description: context.intl.photoCaptureBackDocumentDescription,
              textButton: context.intl.photoCaptureProfileButton,
              onPressed: () {},
            ),
            SizedBox(height: 40),
            PhotoCaptureField(
              title: context.intl.photoCaptureProfileTitle,
              description: context.intl.photoCaptureProfileDescription,
              textButton: context.intl.photoCaptureProfileButton,
              onPressed: () {},
              icon: Icons.person,
              iconColor: lightColorScheme.secondaryContainer,
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonContinue, 
          onPressed: (){
            appRouter.push('/security/driver_license_verification');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: context.intl.secondaryVariantButtonContinueLater, onPressed: (){})
      ],
    );
  }
}