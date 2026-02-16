import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StylesForTexts {
  final BuildContext context;

  StylesForTexts({required this.context});

  TextStyle headerStyle() {
    return TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold,
    );
  }
}
