import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_header_widget.dart';

class DriverConfirmationPage extends StatelessWidget {
  const DriverConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 12.75.w,
                height: 12.75.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Icon(Icons.verified_user, size: 20.sp),
              ),
              SizedBox(height: 2.h),
              DriverFormHeaderWidget(
                title: driverConfirmation.i18n,
                description: driverConfirmationDescription.i18n,
                isCenter: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
