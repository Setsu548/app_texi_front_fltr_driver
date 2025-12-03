import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/driver_basic_info_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_chip_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/origin_destination_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/app/widgets/secondary_variant_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/trip_metrics_widget.dart';
import 'package:app_texi_fltr_driver/dashboard/view/mini_map_box.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TravelDetailsView extends HookWidget {
  const TravelDetailsView({super.key, required this.travel});

  final TravelModel travel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(context.intl.titleTextTravelDetails),
                LabelText(context.intl.labelTextInProgress),
              ],
            ),
            LabelChip(
              text: '15 min',
              colorText: lightColorScheme.onSurface,
              background: lightColorScheme.surfaceVariant,
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            DriverBasicInfo(
              personName: travel.nameDriver,
              rating: travel.ratingDriver,
              numberTrips: '124',
            ),
            SizedBox(height: 20),
            OriginDestination(
              originDescription: travel.originDescription,
              originDestination: travel.destinationDescription,
            ),
            SizedBox(height: 20),
            MiniMapBox(
              initialPosition: LatLng(
                travel.pasangerStartLat,
                travel.pasangerStartLng,
              ),
              destinationPosition: LatLng(
                travel.pasangerEndLat,
                travel.pasangerEndLng,
              ),
            ),
            SizedBox(height: 20),
            TripMetrics(
              distance: '${travel.distance} km',
              time: '${travel.estimatedTime} min',
              tariff: '${travel.earnings} Bs.',
            ),
            SizedBox(height: 20),
            BodyText(context.intl.bodyTextTravelInfo),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context.intl.labelTextPaymentMethod),
                Row(
                  children: [
                    Icon(
                      Icons.account_balance_wallet,
                      color: lightColorScheme.surfaceVariant,
                    ),
                    SizedBox(width: 5),
                    BodyText('Efectivo'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context.intl.labelTextServiceType),
                Row(
                  children: [
                    Icon(
                      Icons.local_taxi,
                      color: lightColorScheme.surfaceVariant,
                    ),
                    SizedBox(width: 5),
                    BodyText('Estandar'),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        PrimaryVariantButton(
          text: context.intl.primaryVariantButtonAcceptTrip,
          onPressed: () {
            appRouter.push('/dashboard/driver_pickup');
          },
        ),
        SizedBox(height: 20),
        SecondaryVariantButton(
          text: context.intl.secondaryVariantButtonBack,
          onPressed: () {
            context.pop();
          },
        ),
      ],
    );
  }
}
