import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LabelTextfieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool multipleLines;

  const LabelTextfieldWidget({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.multipleLines = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 1.15.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.45.w),
          decoration: BoxDecoration(
            color: Color(0xFF262626),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.yellow.withValues(alpha: 0.55),
              width: 1.25,
            ),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            maxLines: multipleLines ? 5 : 1,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              suffixIcon: suffixIcon,
              hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.5)),
            ),
          ),
        ),
      ],
    );
  }
}
