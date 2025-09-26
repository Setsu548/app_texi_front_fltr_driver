import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.text,
    required this.timeText,
    this.isMe = false,
  });

  final String text;
  final String timeText;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final maxW = MediaQuery.of(context).size.width * .78;
    final bg = isMe ? lightColorScheme.primary : lightColorScheme.secondary;
    final fg = isMe ? lightColorScheme.surface : lightColorScheme.onSurface;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxW),
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
            bottomLeft: Radius.circular(isMe ? 12 : 4),
            bottomRight: Radius.circular(isMe ? 4 : 12),
          ),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            BodyText(text, color: fg),
            SizedBox(height: 5),
            LabelText(
              timeText,
              color: fg.withOpacity(.8),
            ),
          ],
        ),
      ),
    );
  }
}