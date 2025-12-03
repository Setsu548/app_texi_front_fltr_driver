import 'package:app_texi_fltr_driver/app/app_router.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/date_chip_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/pill_switch_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/title_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/travel_request_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
import 'package:app_texi_fltr_driver/navigation/utils/format_long_date_two_es.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverDashboardView extends HookWidget {
  const DriverDashboardView({super.key, required this.travel});

  final TravelModel travel;

  @override
  Widget build(BuildContext context) {
    final isOn = useState(false);
    final selectedDate = useState<DateTime>(DateTime.now());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: SizedBox()),
            DateChip(text: formatLongDateTwoEs(selectedDate.value)),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelText(context.intl.labelTextCurrentStatus),
                    BodyText(
                      context.intl.bodyTextActive,
                      color: lightColorScheme.surfaceDim,
                    ),
                  ],
                ),
                PillSwitch(
                  value: isOn.value,
                  onChanged: (v) {
                    isOn.value = v;
                    if (v) {
                      appRouter.push('/dashboard/driver_auth');
                    }
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        CardOnSurface(
          padding: EdgeInsetsGeometry.all(20),
          backgroundColor: lightColorScheme.secondary,
          children: [
            BodyText(
              context.intl.bodyTextTrajectory,
              color: lightColorScheme.primary,
            ),
            SizedBox(height: 10),
            LabelText(context.intl.labelTextTripsAttended),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleText('5,230.75 Bs.', color: lightColorScheme.primary),
                TitleText('750 Km.', color: lightColorScheme.primary),
              ],
            ),
            SizedBox(height: 10),
            LabelText('Periodo: 01/05/2023 - 31/05/2023'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelText(context.intl.labelTextCompletedTrips),
                BodyText('38', color: lightColorScheme.primary),
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        TitleText(context.intl.titleTextTravelRequests),
        LabelText(context.intl.labelTextSelectRequest),
        SizedBox(height: 20),
        TravelRequest(
          originTime: travel.originTime,
          originDescription: travel.originDescription,
          destinationDescription: travel.destinationDescription,
          distance: '${travel.distance} Km',
          estimatedTime: '${travel.estimatedTime} min',
          earnings: '${travel.earnings} Bs.',
          avatarUrl: travel.avatarUrl,
          nameDriver: travel.nameDriver,
          ratingDriver: travel.ratingDriver,
          onPressedAccept: () {
            appRouter.push('/dashboard/driver_pickup');
          },
          onPressedDetail: () {
            appRouter.push('/dashboard/travel_details');
          },
        ),
        SizedBox(height: 20),
        TravelRequest(
          originTime: '3 min',
          originDescription: 'Calle Durango 215, Zona Norte',
          destinationDescription:
              'Aeropuerto Internacional de la Ciudad de Cochabamba',
          onPressedDetail: () {
            appRouter.push('/dashboard/travel_details');
          },
          distance: '12.8 Km',
          estimatedTime: '35 min',
          earnings: '\$20 Bs.',
          avatarUrl: 'assets/images/texi.png',
          nameDriver: 'Carlos Mamani',
          ratingDriver: 4.5,
          onPressedAccept: () {
            appRouter.push('/dashboard/driver_pickup');
          },
        ),
      ],
    );
  }
}
