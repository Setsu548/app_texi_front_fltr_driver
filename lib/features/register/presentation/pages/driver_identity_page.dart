import 'package:flutter/material.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/register/domain/entities/driver_entity.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_header_widget.dart';

class DriverIdentityPage extends StatefulWidget {
  final DriverEntity driver;
  const DriverIdentityPage({super.key, required this.driver});

  @override
  State<DriverIdentityPage> createState() => _DriverIdentityPageState();
}

class _DriverIdentityPageState extends State<DriverIdentityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DriverFormHeaderWidget(
              title: identityVerification.i18n,
              description: identityVerificationDescription.i18n,
            ),
          ],
        ),
      ),
    );
  }
}
