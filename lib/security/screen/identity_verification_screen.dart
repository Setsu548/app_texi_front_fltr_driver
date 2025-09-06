import 'package:app_texi_fltr_driver/security/view/identity_verification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class IdentityVerificationScreen extends HookWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      loadingOverlay: true,
      appBar: null,
      disableBackButton: true,
      onBackButtonPressed: () async {
        return Future.value(true);
      },
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 40),
          IdentityVerificationView(),
        ]
      ),
    );
  }
}
