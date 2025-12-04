import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/driver_status_info_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/link_text_primary_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'simulated_map_box.dart';

class DriverPickupView extends HookWidget {
  // Need to send travel model
  const DriverPickupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonHowToGet,
          onPressed: () {},
          backgroundColor: lightColorScheme.surfaceContainerHigh,
        ),
        SizedBox(height: 20),
        DriverStatusInfo(personName: 'Ana Martinez', rating: 4.9, time: '2:45'),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            InfoTileFlat(
              icon: Icons.send,
              colorIcon: lightColorScheme.surfaceVariant,
              title: context.intl.infoTileFlatPickupPoint,
              description: 'Av. America 1240, Cochabamba',
            ),
            SizedBox(height: 10),
            InfoTileFlat(
              icon: Icons.flag,
              colorIcon: lightColorScheme.surfaceVariant,
              title: context.intl.labelTextDestination,
              description: 'Terminal de Buses Av. Ayachuco',
            ),
          ],
        ),
        SizedBox(height: 20),
        SimulatedRouteMapPage(),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: PrimaryVariantButton(
                backgroundColor: lightColorScheme.surfaceVariant,
                text: context.intl.primaryVariantButtonIArrived,
                onPressed: () {},
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SecondaryVariantButton(
                text: context.intl.secondaryVariantButtonMessage,
                onPressed: () {
                  appRouter.push('/dashboard/driver_chat');
                },
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonStartTrip,
          onPressed: () {
            appRouter.push('/dashboard/driver_dropoff');
          },
        ),
        SizedBox(height: 20),
        LinkTextPrimary(
          context.intl.commonCancel,
          colorText: lightColorScheme.error,
          onTap: () {
            appRouter.push('/dashboard/cancel_trip');
          },
        ),
      ],
    );
  }
}
