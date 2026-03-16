import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';

class CustomDialogue extends StatelessWidget {
  final String title;
  final String message;

  const CustomDialogue({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => context.pop(), child: Text(cancel.i18n)),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
