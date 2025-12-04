import 'package:app_texi_fltr_driver/app/app_router.dart';

import 'package:app_texi_fltr_driver/app/widgets/travel_request_widget.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
import 'package:app_texi_fltr_driver/login/service/travel_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverDashboardView extends HookWidget {
  const DriverDashboardView({super.key, required this.travel});

  final TravelModel travel;

  @override
  Widget build(BuildContext context) {
    

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          onPressedAccept: () async {
            await TravelService().changeStatus(TravelStatus.inComming,travel.id);
            appRouter.push('/dashboard/driver_pickup', extra: travel);
          },
          onPressedDetail: () {
            appRouter.push('/dashboard/travel_details', extra: travel);
          },
        ),
      ],
    );
  }
}
