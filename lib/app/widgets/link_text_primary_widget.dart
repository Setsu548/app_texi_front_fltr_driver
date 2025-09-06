import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class LinkTextPrimary extends StatelessWidget {
  final String text;
  final Color? colorText;
  final VoidCallback onTap;
  final TextAlign textAlign;

  const LinkTextPrimary(
    this.text, {
    Key? key,
    this.textAlign = TextAlign.start,
    required this.onTap,
    this.colorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.labelLarge;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: baseStyle?.copyWith(
          color: colorText ?? lightColorScheme.primary,
          decoration: TextDecoration.none,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
