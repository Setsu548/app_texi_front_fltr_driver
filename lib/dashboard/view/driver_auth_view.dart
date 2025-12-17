import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverAuthView extends HookWidget {
  const DriverAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.local_taxi,
          color: lightColorScheme.primary,
          size: 40,
        ),
        SizedBox(height: 20),
        TitleText(context.intl.titleTextActivateTexi),
        SizedBox(height: 20),
        TitleText(context.intl.titleTextFacialIdentification),
        SizedBox(height: 20),
        BodyText(context.intl.bodyTextFaceInstruction),
        SizedBox(height: 200),
        LabelText(context.intl.labelTextWellLitPlaceWarning, textAlign: TextAlign.center,),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonStartScan, 
          onPressed: (){}
        ),
        // SizedBox(height: 20),
        // SecondaryVariantButton(
        //   text: context.intl.secondaryVariantButtonBack, 
        //   onPressed: (){}
        // ),
        SizedBox(height: 20),
        LabelText(context.intl.labelTextBiometricInfoProtection, textAlign: TextAlign.center,)
      ],
    );
  }
}