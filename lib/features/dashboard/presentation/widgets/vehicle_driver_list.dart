import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi/features/dashboard/presentation/provider/dashboard_providers.dart';

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
          title: Text('${vehicle.brand} ${vehicle.model.toUpperCase()}'),
          subtitle: Text(vehicle.licensePlate),
        );
      },
    );
  }
}
