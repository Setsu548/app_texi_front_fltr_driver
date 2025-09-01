import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class InlineButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const InlineButton({
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
          backgroundColor: MaterialStateProperty.all(lightColorScheme.secondary),
          foregroundColor: MaterialStateProperty.all(lightColorScheme.primary),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
          )
        ),
        child: Text(text),
      ),
    );
  }
}
