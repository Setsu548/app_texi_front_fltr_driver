import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class LinkTextPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const LinkTextPrimary(
    this.text, {
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.labelLarge;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: baseStyle?.copyWith(
          color: lightColorScheme.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
