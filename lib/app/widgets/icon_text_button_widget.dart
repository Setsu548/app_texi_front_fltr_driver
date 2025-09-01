import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'body_text_widget.dart';

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;

  const IconTextButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          decoration: BoxDecoration(
            color: lightColorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
            border: BoxBorder.all(
              color: lightColorScheme.secondaryContainer,
              width: 2
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: iconColor ?? lightColorScheme.onSurface, ),
              SizedBox(width: 20),
              BodyText(label, color: lightColorScheme.secondaryContainer)
            ],
          ),
        ),
      ),
    );
  }
}
