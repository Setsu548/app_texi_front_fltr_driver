import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';

class DriverFrontLicenseWidget extends StatelessWidget {
  const DriverFrontLicenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          padding: EdgeInsets.all(1.5.h),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(
              context,
            ).colorScheme.secondary.withValues(alpha: 0.2),
          ),
          child: Icon(
            Icons.badge,
            size: 25.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(height: 2.75.h),
        Text(
          frontIdentification.i18n,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.6.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 0.7.h),
        Text(
          identificationMessage.i18n,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.6.sp,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
          ),
        ),
        SizedBox(height: 2.75.h),
        SizedBox(
          width: 50.w,
          child: ElevatedButtonWidget(label: takeAPhoto.i18n, onPressed: () {}),
        ),
      ],
    );
  }
}
