import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/theme/styles_for_texts.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            personalInformation.i18n,
            style: StylesForTexts(context: context).headerStyle(),
          ),
          SizedBox(height: 1.15.h),
          Text(
            formHeaderDescription.i18n,
            style: StylesForTexts(context: context).bodyStyle(),
          ),
        ],
      ),
    );
  }
}
