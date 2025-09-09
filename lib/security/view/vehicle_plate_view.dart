import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/labeled_text_field_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/link_text_primary_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehiclePlateView extends HookWidget {
  const VehiclePlateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CardOnSurface(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: lightColorScheme.primary, 
              child: Icon(
                Icons.local_taxi, 
                size: 50,
                color: lightColorScheme.surface, 
              ),
            ),
            SizedBox(height: 20),
            TitleText(
              context.intl.titleTextVehicleVerification,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            BodyText(
              context.intl.bodyTextVehiclePlateInstruction,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            CardPrimaryContainer(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info, color: lightColorScheme.surfaceVariant,),
                    SizedBox(width: 20),
                    Expanded(
                      child: 
                        LabelText(context.intl.labelTextVehiclePlateInfo,
                        color: lightColorScheme.surface)
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            LabeledTextField(label: context.intl.labeledTextFieldVehiclePlate, colorLabel: lightColorScheme.surface, hint: context.intl.hintTextVehiclePlate),
            SizedBox(height: 20),
            PrimaryVariantButton(
              text: context.intl.primaryVariantButtonVerifyVehicle, 
              onPressed: (){
                appRouter.push('/security/vehicle_found');
              }
            ),
            SizedBox(height: 20),
            LinkTextPrimary(
              context.intl.linkTextRegisterNewVehicle,
              colorText: lightColorScheme.surfaceVariant, 
              textAlign: TextAlign.center, 
              onTap: (){}
            )
          ],
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(text: context.intl.secondaryVariantButtonContinueLater, onPressed: (){},)
      ],
    );
  }
}