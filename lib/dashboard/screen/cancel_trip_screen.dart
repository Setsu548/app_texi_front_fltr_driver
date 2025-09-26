import 'package:app_texi_fltr_driver/app/app_bar_logo_home.dart';
import 'package:app_texi_fltr_driver/dashboard/view/cancel_trip_view.dart';
import 'package:app_texi_fltr_driver/navigation/view/side_menu_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class CancelTripScreen extends HookWidget {
  const CancelTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context),
      endDrawer: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.paddingOf(context).top - 50 + kToolbarHeight,
        ),
        child: Drawer(
          child: SideMenuView(),
        ),
      ),
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 10),
          CancelTripView()
        ]
      ),
    );
  }
}
