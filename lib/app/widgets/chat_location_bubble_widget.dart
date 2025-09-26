import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class ChatLocationBubble extends StatelessWidget {
  const ChatLocationBubble({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeText,
  });

  final String title;
  final String subtitle;
  final String timeText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36, 
                  height: 36,
                  decoration: BoxDecoration(
                    color: lightColorScheme.secondary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.near_me_rounded,
                      color: lightColorScheme.primary, size: 20),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: lightColorScheme.secondary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BodyText(title,color: lightColorScheme.onSurface),
                      LabelText(subtitle, color:lightColorScheme.onSurface.withOpacity(.8)),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: EdgeInsets.only(left: 46),
              child: LabelText(
                timeText, color: lightColorScheme.onSurface.withOpacity(.6)
              ),
            ),
          ],
        ),
      ),
    );
  }
}