import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class LinkTextSecondary extends StatelessWidget {
  final String text;
  final Color? colorText;
  final VoidCallback onTap;

  const LinkTextSecondary(
    this.text, {
    this.colorText,
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyLarge;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: baseStyle?.copyWith(
          color: colorText ?? lightColorScheme.primary,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
