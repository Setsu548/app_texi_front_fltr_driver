import 'package:app_texi_fltr_driver/app/app_bar_logo_home.dart';
import 'package:app_texi_fltr_driver/dashboard/view/driver_pickup_view.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
// import 'package:app_texi_fltr_driver/navigation/view/side_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class DriverPickupScreen extends HookWidget {
  const DriverPickupScreen({super.key, required this.travel});

  final TravelModel travel;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context,false,false),
      endDrawer: null,
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(false);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          DriverPickupView(travel: travel,)
        ]
      ),
    );
  }
}
