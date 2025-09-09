import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/driver_status_info_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverDropoffView extends HookWidget {
  const DriverDropoffView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonHowToGet, 
          onPressed: (){},
          backgroundColor: lightColorScheme.surfaceContainerHigh,
        ),
        SizedBox(height: 20),
        DriverStatusInfo(
          personName: 'Ana Martinez', 
          rating: 4.9, 
          colorRating: lightColorScheme.primary,
          time: '2:45'
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [ 
            InfoTileFlat(
              icon: Icons.send, 
              colorIcon: lightColorScheme.surfaceContainerHigh,
              title: context.intl.infoTileFlatPickupPoint, 
              description: 'Av. America 1240, Cochabamba'
            ),
            SizedBox(height: 10),
            InfoTileFlat(
              icon: Icons.flag, 
              colorIcon: lightColorScheme.primary,
              title: context.intl.labelTextDestination, 
              description: 'Terminal de Buses Av. Ayachuco'
            ),
          ]
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(
                  context.intl.labelTextTariff
                ),
                BodyText('Bs. 25.00')
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(
                  context.intl.labelTextPaymentMethod
                ),
                Row(
                  children: [
                    Icon(Icons.payments, color: lightColorScheme.surfaceDim),
                    SizedBox(width: 6),
                    BodyText('Efectivo')
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonEndTrip, 
          onPressed: (){
            appRouter.push('/dashboard/travel_rating');
          }
        )
      ],
    );
  }
}