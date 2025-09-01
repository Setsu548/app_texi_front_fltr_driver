import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';

class BodyTextPrimary extends StatelessWidget {
  final String text;

  const BodyTextPrimary(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyLarge;

    return Text(
      text,
      style: baseStyle?.copyWith(
        fontWeight: FontWeight.w700,
        color: lightColorScheme.primary
      ),
    );
  }
}