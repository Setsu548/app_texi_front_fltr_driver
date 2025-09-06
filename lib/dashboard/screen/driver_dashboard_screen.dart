import 'package:app_texi_fltr_driver/app/app_bar_logo_home.dart';
import 'package:app_texi_fltr_driver/app/app_scaffold.dart';
import 'package:app_texi_fltr_driver/dashboard/view/driver_dashboard_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DriverDashboardScreen extends HookWidget {
  const DriverDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true, 
      onPopInvoked: (didPop) async {
        if (!didPop) {
          if (!Navigator.of(context).canPop()) {
            SystemNavigator.pop();
          }
        }
      },
      child: AppScaffold(
        loadingOverlay: true,
        appBar: AppBarLogoHome(context),
        disableBackButton: true, 
        onBackButtonPressed: () async {
          if (!Navigator.of(context).canPop()) {
            SystemNavigator.pop();
            return false; 
          }
          return true;
        },
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: const [
            SizedBox(height: 10),
            DriverDashboardView(),
          ],
        ),
      ),
    );
  }
}
