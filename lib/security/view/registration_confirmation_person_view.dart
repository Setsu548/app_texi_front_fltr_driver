import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/link_text_secondary_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegistrationConfirmationPersonView extends HookWidget {
  const RegistrationConfirmationPersonView({super.key});

  @override
  Widget build(BuildContext context) {
    const double labelWidth = 100;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: lightColorScheme.primary, 
          child: Icon(
            Icons.person, 
            size: 50,
            color: lightColorScheme.surface, 
          ),
        ),
        SizedBox(height: 20),
        TitleText(context.intl.titleTextRegistrationConfirmation, color: lightColorScheme.primary),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: LabelText(context.intl.labelTextVerifyData, color: lightColorScheme.primary),
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(15),
          children: [
            Row(
              children: [
                Expanded(child: BodyText(context.intl.bodyTextInformationSummary, color: lightColorScheme.surface)),
                Icon(Icons.info, color: lightColorScheme.surfaceDim,),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: BodyText(context.intl.bodyTextPersonalInformation, color: lightColorScheme.surface)),
                LinkTextSecondary(
                  context.intl.linkTextEdit, 
                  colorText: lightColorScheme.surfaceDim,
                  onTap: (){},
                )
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.bodyTextName, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('Carlos Rodriguez', color: lightColorScheme.surface),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.bodyTextCI, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('48765432A', color: lightColorScheme.surface,),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.bodyTextPhone, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('7777777', color: lightColorScheme.surface,),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.bodyTextEmail, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText(
                        'carlos.rodriguez@email.com',
                        color: lightColorScheme.surface, 
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.bodyTextLicenseCategory, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('B', color: lightColorScheme.surface,),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonSubmitRequest, 
          onPressed: (){
            appRouter.push('/security/vehicle_selection');
          }
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.check_circle, color: lightColorScheme.surfaceDim),
                SizedBox(width: 20),
                Expanded(child: LabelText(context.intl.bodyTextAllDataSubmitted, color: lightColorScheme.surface))
              ],
            ),
          ],
        )
      ],
    );
  }
}