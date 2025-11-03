import 'package:app_texi_fltr_driver/login/view/vehicle_photo_registration_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_bar_logo_home.dart';
import '../../app/app_scaffold.dart';

class VehiclePhotoRegistrationScreen extends HookWidget {
  const VehiclePhotoRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      loadingOverlay: true,
      appBar: AppBarLogoHome(context, showMenu: false),
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          VehiclePhotoRegistrationView(),
        ]
      ),
    );
  }
}
