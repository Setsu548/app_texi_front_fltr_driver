import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class ChatDayDivider extends StatelessWidget {
  const ChatDayDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Expanded(child: Divider(height: 1)),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: lightColorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: LabelText(
              text, color: lightColorScheme.onSurface.withOpacity(.8),
            ),
          ),
          Expanded(child: Divider(height: 1)),
        ],
      ),
    );
  }
}