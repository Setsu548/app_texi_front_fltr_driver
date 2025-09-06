import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class DriverBasicInfo extends StatelessWidget {
  final String personName;
  final double rating;
  final String numberTrips;

  const DriverBasicInfo({
    super.key,
    required this.personName,
    required this.rating,
    required this.numberTrips,
  });

  @override
Widget build(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: BodyText(
          personName,
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min, 
        children: [
          Icon(Icons.star, color: lightColorScheme.surfaceVariant, size: 20),
          SizedBox(width: 4),
          LabelText('$rating'),
          SizedBox(width: 4),
          LabelText('($numberTrips viajes)')
        ],
      ),
    ],
  );
}

}
