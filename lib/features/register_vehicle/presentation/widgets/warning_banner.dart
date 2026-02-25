import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';

class WarningBanner extends StatelessWidget {
  const WarningBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.wb_sunny_outlined,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 1.5.h),
          Text(
            goodLightingRequired.i18n,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 0.5.h),
          Text(
            goodLightingDescription.i18n,
            style: TextStyle(color: Colors.grey[400], fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
