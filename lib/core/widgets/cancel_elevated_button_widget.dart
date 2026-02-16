import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CancelElevatedButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String label;
  final VoidCallback onPressed;

  CancelElevatedButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    double? width,
    double? height,
  }) : width = width ?? 80.w,
       height = height ?? 5.h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1f2937),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        onPressed: onPressed,
        child: Text(label),
      ),
    );
  }
}
