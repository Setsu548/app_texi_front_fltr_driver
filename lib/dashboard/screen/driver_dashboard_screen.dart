import 'package:app_texi_fltr_driver/app/app_bar_logo_home.dart';
import 'package:app_texi_fltr_driver/app/app_scaffold.dart';
import 'package:app_texi_fltr_driver/dashboard/view/driver_dashboard_view.dart';
import 'package:app_texi_fltr_driver/login/models/travel_model.dart';
import 'package:app_texi_fltr_driver/navigation/view/side_menu_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        endDrawer: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.paddingOf(context).top - 50 + kToolbarHeight,
          ),
          child: Drawer(child: SideMenuView()),
        ),
        disableBackButton: true,
        onBackButtonPressed: () async {
          if (!Navigator.of(context).canPop()) {
            SystemNavigator.pop();
            return false;
          }
          return true;
        },
        body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('drive')
              .doc('0qvko8CUw9u2Lh0mSHT0')
              .get(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              final travel = TravelModel.fromFirebase(
                asyncSnapshot.data!.data() ?? {},
              );
              return ListView(
                padding: const EdgeInsets.all(10.0),
                children: [
                  SizedBox(height: 10),
                  DriverDashboardView(travel: travel),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
