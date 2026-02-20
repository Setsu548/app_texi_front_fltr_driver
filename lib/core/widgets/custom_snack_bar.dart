import 'package:flutter/material.dart';

SnackBar customSnackBar(String message, BuildContext context) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Theme.of(context).colorScheme.primary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}
