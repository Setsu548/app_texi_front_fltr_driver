import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';

class SmallTextSecondary extends StatelessWidget {
  final String text;

  const SmallTextSecondary(
    this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10,
        color: lightColorScheme.secondary
      )
    );
  }
}