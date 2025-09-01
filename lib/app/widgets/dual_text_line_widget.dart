import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'body_text_widget.dart';

class DualTextLine extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Color? rightTextColor;
  final Color? leftTextColor;

  const DualTextLine({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.rightTextColor, 
    this.leftTextColor, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(
              leftText,
              color: leftTextColor ?? lightColorScheme.surfaceVariant ,
            ),
            BodyText(
              rightText,
              color: rightTextColor ?? lightColorScheme.primary ,
            ),
          ],
        ),
        SizedBox(height: 8),
        Divider(
          color: lightColorScheme.secondaryContainer,
          thickness: 8,
        ),
      ],
    );
  }
}
