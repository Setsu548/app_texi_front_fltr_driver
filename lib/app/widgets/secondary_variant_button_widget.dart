import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class SecondaryVariantButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryVariantButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;


    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: baseStyle?.copyWith(
          foregroundColor: MaterialStateProperty.all(lightColorScheme.onSurface),
          backgroundColor: MaterialStateProperty.all(lightColorScheme.secondaryContainer),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          )
        ),
        child: Text(text),
      ),
    );
  }
}
