import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class OutlinedSmallButton extends StatelessWidget {
  final String text;
  final Color? colorText;
  final Color? background;
  final VoidCallback onPressed;

  const OutlinedSmallButton({
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
        backgroundColor: MaterialStateProperty.all(background ?? lightColorScheme.secondaryContainer),
        foregroundColor: MaterialStateProperty.all(colorText ?? lightColorScheme.onSurface),
        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30, vertical: 12)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: BorderSide(
              color: colorText ?? lightColorScheme.onSurface,
              width: 1.5,
            ),
          ),
        ),
        elevation: MaterialStateProperty.all(0),
      ),
      child: BodyText(
        text,
        color: colorText ?? lightColorScheme.onSurface,
      ),
    );
  }
}
