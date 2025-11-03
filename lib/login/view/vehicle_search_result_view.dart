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
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VehicleSearchResultView extends HookWidget {
  const VehicleSearchResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: lightColorScheme.primary, 
              child: Icon(
                Icons.warning, 
                size: 50,
                color: lightColorScheme.surface, 
              ),
            ),
            SizedBox(height: 20),
            TitleText(
              context.intl.titleTextVehicleNotFound,
              color: lightColorScheme.surface,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            BodyText(
              context.intl.bodyTextVehicleNotFoundInstruction,
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
                        LabelText(context.intl.labelTextVehicleNotFoundInfo,
                        color: lightColorScheme.surface)
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            PrimaryVariantButton(
              text: context.intl.primaryVariantButtonRetry, 
              onPressed: (){}
            ),
            SizedBox(height: 20),
            SecondaryVariantButton(
              text: context.intl.secondaryVariantButtonBackHome, 
              onPressed: (){
                appRouter.push('/security/login');
              },
            )
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(
              context.intl.bodyTextNeedRegisterVehicle,
              color: lightColorScheme.primary,
            ),
            SizedBox(height: 20),
            LabelText(context.intl.labelTextRegisterVehicleInfo),
            SizedBox(height: 20),
            PrimaryVariantButton(
              text: context.intl.primaryVariantButtonRegisterNewVehicle, 
              onPressed: (){}
            )
          ]
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 150,
          decoration: BoxDecoration(
            color: lightColorScheme.secondary,
            image: DecorationImage(
              image: AssetImage('assets/images/texi.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}