import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'body_text_widget.dart';
import 'label_text_widget.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String description;
  final VoidCallback onTap;

  const InfoTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: BoxDecoration(
            color: lightColorScheme.secondary,
            borderRadius: BorderRadius.circular(15),
            border: BoxBorder.all(
              color: lightColorScheme.secondaryContainer,
              width: 2
            )
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: lightColorScheme.surfaceVariant),
              SizedBox(width: 20),
              Column(
                children: [
                  BodyText(label),
                  LabelText(description),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
