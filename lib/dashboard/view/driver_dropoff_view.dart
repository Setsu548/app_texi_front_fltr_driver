import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/driver_status_info_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_variant_button.dart';
import 'package:app_texi_fltr_driver/dashboard/view/simulated_map_box.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
import 'package:app_texi_fltr_driver/login/service/travel_service.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DriverDropoffView extends HookWidget {
  const DriverDropoffView({super.key, required this.travel});

  final TravelModel travel;

  @override
  Widget build(BuildContext context) {
    final startPoint = LatLng(travel.pasangerStartLat, travel.pasangerStartLng);
    final endPoint   = LatLng(travel.pasangerEndLat, travel.pasangerEndLng);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // PrimaryVariantButton(
        //   text: context.intl.primaryVariantButtonHowToGet, 
        //   onPressed: (){},
        //   backgroundColor: lightColorScheme.surfaceContainerHigh,
        // ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween(begin: 0.5, end: 1.0),
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              builder: (context, value, _) {
                return Container(
                  width: 10 * value,
                  height: 10 * value,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                );
              },
              onEnd: () {},
            ),
            SizedBox(width: 8),
            Text(
              "En camino al destino",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        SimulatedRouteMapPage(
          start: startPoint,
          end: endPoint,
        ),
        SizedBox(height: 20),
        DriverStatusInfo(
          personName: travel.nameDriver, 
          rating: 4.9, 
          colorRating: lightColorScheme.primary,
          time: '${travel.estimatedTime}:00'
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
              description: travel.originDescription
            ),
            SizedBox(height: 10),
            InfoTileFlat(
              icon: Icons.flag, 
              colorIcon: lightColorScheme.primary,
              title: context.intl.labelTextDestination, 
              description: travel.destinationDescription
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
                BodyText('Bs ${travel.earnings}')
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
          onPressed: () async {
            await TravelService().changeStatus(TravelStatus.endTravel,travel.id);
            appRouter.push('/dashboard/travel_rating',extra: travel);
          }
        ),
        SizedBox(height: 30),
      ],
    );
  }
}