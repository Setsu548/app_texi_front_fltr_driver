import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class SecondaryButtonIcon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon; 
  final Color? iconColor;
  final double iconSize;

  const SecondaryButtonIcon({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.iconColor,
    this.iconSize = 80, 
  });

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none, 
        children: [
          ElevatedButton(
            onPressed: onPressed,
            style: baseStyle?.copyWith(
              foregroundColor: MaterialStateProperty.all(lightColorScheme.surfaceTint),
              backgroundColor: MaterialStateProperty.all(lightColorScheme.secondary),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  side: BorderSide(
                    color: lightColorScheme.primary,
                    width: 2,
                  ),
                ),
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: Text(text),
              ),
            ),
          ),
          Positioned(
            right: -iconSize * 0.1, 
            top: -10,
            bottom: -10,
            child: Center(
              child: CircleAvatar(
                radius: iconSize / 2,
                backgroundColor: lightColorScheme.primary,
                child: Icon(
                  icon,
                  color: iconColor,
                  size: iconSize * 0.6,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
