import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class DangerButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DangerButton({
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
          foregroundColor: MaterialStateProperty.all(lightColorScheme.error),
          backgroundColor: MaterialStateProperty.all(lightColorScheme.secondary),
          overlayColor: MaterialStateProperty.all(lightColorScheme.error.withOpacity(0.1)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              side: BorderSide(
                color: lightColorScheme.error,
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
