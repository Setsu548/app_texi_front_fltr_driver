import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class DriverInfoSecondary extends StatelessWidget {
  final String personName;
  final String avatarUrl;
  final double rating;

  const DriverInfoSecondary({
    super.key,
    required this.personName,
    required this.avatarUrl,
    required this.rating,
  });

  @override
Widget build(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(avatarUrl),
        backgroundColor: lightColorScheme.surface,
      ),
      const SizedBox(width: 10),
      Expanded(
        child: BodyText(
          personName,
          maxLines: 1,              
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Icon(Icons.star, color: lightColorScheme.surfaceVariant, size: 20),
          SizedBox(width: 4),
          LabelText('$rating'),
          SizedBox(width: 35)
        ],
      ),
    ],
  );
}

}
