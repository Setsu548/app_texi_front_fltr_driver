import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/theme/styles_for_texts.dart';

class DriverFormHeaderWidget extends StatelessWidget {
  final String title;
  final String description;
  const DriverFormHeaderWidget({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: StylesForTexts(context: context).headerStyle()),
          SizedBox(height: 1.15.h),
          Text(
            description,
            style: StylesForTexts(context: context).bodyStyle(),
          ),
        ],
      ),
    );
  }
}
