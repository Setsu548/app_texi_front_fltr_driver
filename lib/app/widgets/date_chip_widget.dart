import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class DateChip extends StatelessWidget {
  final String text;       
  final Color? color;        

  const DateChip({
    super.key,
    required this.text,
    this.color, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: color ?? lightColorScheme.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      child: BodyText(
        text,
        color: color ?? lightColorScheme.primary,
      ),
    );
  }
}
