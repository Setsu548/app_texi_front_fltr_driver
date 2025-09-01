import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
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
          foregroundColor: MaterialStateProperty.all(lightColorScheme.surfaceTint),
          backgroundColor: MaterialStateProperty.all(lightColorScheme.secondary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              side: BorderSide(
                color: lightColorScheme.primary,
                width: 2,
              )
            ),
          )
        ),
        child: Text(text),
      ),
    );
  }
}
