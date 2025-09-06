import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class PrimarySmallButton extends StatelessWidget {
  final String text;
  final Color? colorText;
  final Color? background;
  final VoidCallback onPressed;

  const PrimarySmallButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.colorText,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    return ElevatedButton(
      onPressed: onPressed,
      style: baseStyle?.copyWith(
        backgroundColor: MaterialStateProperty.all(background ?? lightColorScheme.primary),
        foregroundColor: MaterialStateProperty.all(colorText ??lightColorScheme.surface),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      child: BodyText(
        text,
        color: colorText ?? lightColorScheme.surface,
      ),
    );
  }
}
