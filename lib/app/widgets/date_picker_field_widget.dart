import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';

class DatePickerField extends StatelessWidget {
  const DatePickerField({
    super.key,
    required this.dateText,       
    required this.onTap,
    this.radius = 10,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.backgroundColor,
    this.borderColor,
    this.arrowColor,
    this.enabled = true,
  });

  final String dateText;
  final VoidCallback onTap;
  final double radius;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? arrowColor;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(radius),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      child: Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? lightColorScheme.secondary,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor ?? lightColorScheme.onSurface,)
        ),
        child: Row(
          children: [
            Expanded(
              child: BodyText(
                dateText,
                color: lightColorScheme.secondary,
              ),
            ),
            Icon(
              Icons.expand_more_rounded,
              size: 25,
              color: arrowColor ?? lightColorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
