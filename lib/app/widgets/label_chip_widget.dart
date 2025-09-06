import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class LabelChip extends StatelessWidget {
  final String text;    
  final Color? colorText;   
  final Color? background;        

  const LabelChip({
    super.key,
    required this.text,
    this.colorText,
    this.background, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background ?? lightColorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BodyText(
        text,
        color: colorText ?? lightColorScheme.surfaceVariant,
      ),
    );
  }
}
