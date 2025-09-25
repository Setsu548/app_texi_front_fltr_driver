import 'package:app_texi_fltr_driver/app/app_bar_logo_home.dart';
import 'package:app_texi_fltr_driver/dashboard/view/driver_pickup_view.dart';
import 'package:app_texi_fltr_driver/navigation/view/side_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class DriverPickupScreen extends HookWidget {
  const DriverPickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context),
      endDrawer: Drawer( 
        child: SideMenuView()
      ),
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          DriverPickupView()
        ]
      ),
    );
  }
}
