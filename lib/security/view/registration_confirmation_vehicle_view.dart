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

class RegistrationConfirmationVehicleView extends HookWidget {
  const RegistrationConfirmationVehicleView({super.key});

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
        TitleText(context.intl.titleTextRegistrationConfirmationVehicle, color: lightColorScheme.primary),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: LabelText(context.intl.labelTextVerifyVehicleData, color: lightColorScheme.primary),
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
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
                Expanded(child: BodyText(context.intl.bodyTextVehicleInformation, color: lightColorScheme.surface)),
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
                      child: BodyText(context.intl.labelVehicleBrand, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('Toyota', color: lightColorScheme.surface),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.labelVehicleModel, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('Corolla', color: lightColorScheme.surface,),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.labelVehicleYear, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('2020', color: lightColorScheme.surface,),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.labelVehiclePlate, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText(
                        'ABC-123',
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
                      child: BodyText(context.intl.labelVehicleCategory, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('B', color: lightColorScheme.surface,),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: labelWidth,
                      child: BodyText(context.intl.labelVehicleColor, color: lightColorScheme.secondaryContainer),
                    ),
                    Expanded(
                      child: BodyText('Gris Plata', color: lightColorScheme.surface,),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: BodyText(context.intl.bodyTextDocuments, color: lightColorScheme.surface)),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.article, color: lightColorScheme.error),
                        SizedBox(width: 20),
                        BodyText(context.intl.labelVehicleRegistrationCard, color: lightColorScheme.surface),
                      ],
                    ),
                    Icon(Icons.check_circle_sharp, color: lightColorScheme.surfaceDim)
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.photo_camera, color: lightColorScheme.surfaceContainerHigh),
                        SizedBox(width: 20),
                        BodyText(context.intl.labelVehiclePhoto, color: lightColorScheme.surface),
                      ]
                    ),
                    Icon(Icons.check_circle_sharp, color: lightColorScheme.surfaceDim)
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.description, color: lightColorScheme.primary),
                        SizedBox(width: 20),
                        BodyText(context.intl.labelVehicleInsurance, color: lightColorScheme.surface),
                      ],
                    ),
                    Icon(Icons.check_circle_sharp, color: lightColorScheme.surfaceDim)
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonSubmitRequest, 
          onPressed: (){}
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
                Expanded(child: LabelText(context.intl.labelTextAllDataSent, color: lightColorScheme.surface))
              ],
            ),
          ],
        )
      ],
    );
  }
}