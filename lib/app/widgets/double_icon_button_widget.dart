import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';
import 'body_text_widget.dart';
import 'label_text_widget.dart';

class DoubleIconButton extends StatelessWidget {
  final IconData leadingIcon;   
  final String title;           
  final String description;    
  final IconData trailingIcon;  
  final VoidCallback onTap;     

  const DoubleIconButton({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.description,
    required this.trailingIcon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).elevatedButtonTheme.style;
    return ElevatedButton(
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
      onPressed: onTap,
      child: Row(
        children: [
          Icon(leadingIcon, color: lightColorScheme.primary, size: 25),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                BodyText(title),
                LabelText(description)
              ],
            ),
          ),

          const SizedBox(width: 20),
          Icon(trailingIcon, color: lightColorScheme.primary, size: 25),
        ],
      ),
    );
  }
}
