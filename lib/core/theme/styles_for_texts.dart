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

  TextStyle bodyStyle() {
    return TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
      fontSize: 14.5.sp,
      fontWeight: FontWeight.w500,
    );
  }
}
