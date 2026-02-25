import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/theme/styles_for_texts.dart';

class DriverFormHeaderWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool isCenter;
  const DriverFormHeaderWidget({
    super.key,
    required this.title,
    required this.description,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: isCenter
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: StylesForTexts(context: context).headerStyle(),
          ),
          SizedBox(height: 1.15.h),
          Text(
            description,
            textAlign: isCenter ? TextAlign.center : TextAlign.start,
            style: StylesForTexts(context: context).bodyStyle(),
          ),
        ],
      ),
    );
  }
}
