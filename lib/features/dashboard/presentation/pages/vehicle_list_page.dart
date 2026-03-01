import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/features/dashboard/presentation/widgets/vehicle_driver_list.dart';
import 'package:texi/features/dashboard/presentation/widgets/vehicle_list_header_widget.dart';

class VehicleListPage extends StatelessWidget {
  const VehicleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          children: [
            VehicleListHeaderWidget(title: 'Vehículos'),
            SizedBox(height: 2.h),
            Expanded(child: VehicleDriverList()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
