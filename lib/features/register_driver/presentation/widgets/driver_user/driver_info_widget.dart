import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/theme/styles_for_texts.dart';

class DriverInfoWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  const DriverInfoWidget({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 15.w,
          child: Icon(
            icon,
            size: 23.75.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(
          width: 45.w,
          child: Text(
            text,
            style: StylesForTexts(context: context).bodyStyle(),
          ),
        ),
      ],
    );
  }
}
