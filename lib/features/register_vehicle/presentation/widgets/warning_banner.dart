import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5.h,
            width: 10.w,
            child: Center(
              child: Icon(
                Icons.wb_sunny_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(width: 1.5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                goodLightingRequired.i18n,
                style: StylesForTexts(context: context)
                    .headerStyleSmall()
                    .copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15.75.sp,
                    ),
              ),
              SizedBox(height: 0.5.h),
              SizedBox(
                width: 70.w,
                child: Text(
                  goodLightingDescription.i18n,
                  style: StylesForTexts(
                    context: context,
                  ).bodyStyle().copyWith(fontSize: 13.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
