import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/theme/styles_for_texts.dart';

class ConfirmationMessage extends StatelessWidget {
  const ConfirmationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.h,
      width: 85.w,
      padding: EdgeInsets.symmetric(vertical: 2.3.h, horizontal: 2.3.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(Icons.info, color: Theme.of(context).colorScheme.primary),
          SizedBox(width: 2.3.w),
          SizedBox(
            width: 64.w,
            child: Text(
              confirmationMessage.i18n,
              style: StylesForTexts(context: context).bodyStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
