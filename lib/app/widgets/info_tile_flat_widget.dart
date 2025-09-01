import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'body_text_widget.dart';
import 'label_text_widget.dart';

class InfoTileFlat extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Color? colorIcon;

  const InfoTileFlat({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    this.colorIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: colorIcon ?? lightColorScheme.secondaryContainer,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BodyText(title),
              LabelText(description),
            ],
          ),
        ),
      ],
    );
  }
}
