import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar(
    {
      required this.onTap,
      super.key
    }
    );

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                isDense: true,
                hintText: context.intl.hintChatInputWriteMessage,
                filled: true,
                fillColor: lightColorScheme.secondary,
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: lightColorScheme.secondaryContainer),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: lightColorScheme.secondaryContainer),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            splashColor: Colors.transparent,
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                color: lightColorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.play_arrow_rounded,
                  color: lightColorScheme.onPrimary),
            ),
          )
        ],
      ),
    );
  }
}