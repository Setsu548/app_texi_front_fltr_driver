import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';
import 'package:texi_driver/features/dashboard/presentation/provider/dashboard_providers.dart';

class VehicleDriverList extends ConsumerWidget {
  const VehicleDriverList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleList = ref.watch(vehicleListProvider);
    return ListView.builder(
      itemCount: vehicleList.data!.length,
      itemBuilder: (context, index) {
        final vehicle = vehicleList.data![index];
        return ListTile(
          leading: Icon(
            Icons.car_rental_outlined,
            size: 25.sp,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            '${vehicle.brand} ${vehicle.model.toUpperCase()}',
            style: StylesForTexts(context: context).headerStyleSmall(),
          ),
          subtitle: Text(
            vehicle.licensePlate,
            style: StylesForTexts(context: context).bodyStyle(),
          ),
          onTap: () {
            context.push(AppRouter.dashboardLocation);
          },
        );
      },
    );
  }
}
