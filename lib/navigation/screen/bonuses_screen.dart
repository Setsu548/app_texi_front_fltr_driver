import 'package:app_texi_fltr_driver/navigation/view/bonuses_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../app/app_scaffold.dart';

class BonusesScreen extends HookWidget {
  const BonusesScreen({super.key});

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
          BonusesView()
        ]
      ),
    );
  }
}
