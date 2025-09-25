import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class SecondaryVariantButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? borderColor;
  final double borderWidth;

  const SecondaryVariantButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.borderColor,    
    this.borderWidth = 2
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    final style = (baseStyle ?? const ButtonStyle()).copyWith(
      foregroundColor:
          MaterialStateProperty.all(lightColorScheme.onSurface),
      backgroundColor:
          MaterialStateProperty.all(lightColorScheme.secondaryContainer),

      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          side: borderColor != null
              ? BorderSide(color: borderColor!, width: borderWidth)
              : BorderSide.none,
        ),
      ),
    );

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(text),
      ),
    );
  }
}
