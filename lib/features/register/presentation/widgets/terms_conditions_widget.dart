import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';

class TermsConditionsWidget extends StatelessWidget {
  const TermsConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: continueText.i18n,
              style: TextStyle(color: Colors.white, fontSize: 12.75.sp),
            ),
            TextSpan(
              text: ' ${termAndConditions.i18n} ',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12.75.sp,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle term and conditions tap
                },
            ),
            TextSpan(
              text: ' ${andOur.i18n} ',
              style: TextStyle(color: Colors.white, fontSize: 12.75.sp),
            ),
            TextSpan(
              text: ' ${privacyPolitic.i18n}',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 12.75.sp,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle privacy politic tap
                },
            ),
          ],
        ),
      ),
    );
  }
}
