import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_primary_container_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehicleFoundView extends HookWidget {
  const VehicleFoundView({super.key});

  @override
  Widget build(BuildContext context) {

    const double labelWidth = 100;
    
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
                Icons.check_circle_sharp, 
                size: 50,
                color: lightColorScheme.surface, 
              ),
            ),
            SizedBox(height: 20),
            TitleText(
              context.intl.titleTextVehicleFound,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            BodyText(
              context.intl.bodyTextVehicleFoundInstruction,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),  
            CardPrimaryContainer(
              children: [
                Row(
                  children: [
                    Icon(Icons.local_taxi),
                    SizedBox(width: 20),
                    BodyText(context.intl.bodyTextVehicleDetails, color: lightColorScheme.surface)
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: BodyText(context.intl.labelTextVehiclePlate, color: lightColorScheme.secondaryContainer),
                        ),
                        Expanded(
                          child: BodyText('ABC-123', color: lightColorScheme.surface),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: BodyText(context.intl.labelTextVehicleModel, color: lightColorScheme.secondaryContainer),
                        ),
                        Expanded(
                          child: BodyText('Toyota Corolla', color: lightColorScheme.surface,),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: labelWidth,
                          child: BodyText(context.intl.labelTextVehicleYear, color: lightColorScheme.secondaryContainer),
                        ),
                        Expanded(
                          child: BodyText('2019', color: lightColorScheme.surface,),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),  
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/texi.png'),
                  fit: BoxFit.cover,
                ),
              ),
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
                        LabelText(context.intl.bodyTextVehicleNotificationInfo,
                        color: lightColorScheme.surface)
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonBackHome, 
          onPressed: (){
            appRouter.push('/security/login');
          }
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: context.intl.secondaryVariantButtonCheckStatus, 
          onPressed: (){
            appRouter.push('/security/vehicle_search_result');
          },
        )
      ],
    );
  }
}