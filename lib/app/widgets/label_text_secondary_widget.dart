import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';

class LabelTextSecondary extends StatelessWidget {
  final String text;

  const LabelTextSecondary(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.labelLarge;

    return Text(
      text,
      style: baseStyle?.copyWith(
        color: lightColorScheme.secondary, 
      ),
    );
  }
}