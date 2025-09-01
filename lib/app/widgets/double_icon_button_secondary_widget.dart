import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'body_text_widget.dart';
import 'label_text_widget.dart';

class DoubleIconButtonSecondary extends StatelessWidget {
  final IconData leadingIcon;   
  final String title;           
  final String description;    
  final IconData trailingIcon;  
  final VoidCallback onTap;     

  final Color? leadingBackgroundColor;
  final Color? leadingIconColor;
  final Color? trailingBackgroundColor;
  final Color? trailingIconColor;

  const DoubleIconButtonSecondary({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.description,
    required this.trailingIcon,
    required this.onTap,
    this.leadingBackgroundColor,
    this.leadingIconColor,
    this.trailingBackgroundColor,
    this.trailingIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: lightColorScheme.secondary,
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: leadingBackgroundColor ?? lightColorScheme.primary,
              radius: 22,
              child: Icon(
                leadingIcon,
                color: leadingIconColor ?? lightColorScheme.onPrimary,
                size: 24,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  BodyText(title),
                  LabelText(description),
                ],
              ),
            ),
            SizedBox(width: 20),
            CircleAvatar(
              backgroundColor: trailingBackgroundColor ?? lightColorScheme.primary,
              radius: 22,
              child: Icon(
                trailingIcon,
                color: trailingIconColor ?? lightColorScheme.onPrimary,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
