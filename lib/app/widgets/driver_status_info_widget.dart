import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class DriverStatusInfo extends StatelessWidget {
  final String personName;
  final double rating;
  final Color? colorRating;
  final String time;

  const DriverStatusInfo({
    super.key,
    required this.personName,
    required this.rating,
    this.colorRating,
    required this.time,
  });

  @override
Widget build(BuildContext context) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyText(
              personName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                Icon(Icons.star, color: colorRating ?? lightColorScheme.surfaceVariant, size: 20),
                SizedBox(width: 4),
                LabelText('$rating'),
              ],
            )
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: lightColorScheme.secondary,
          borderRadius: BorderRadius.circular(12), 
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabelText(context.intl.labelTextWaitingTime),
            BodyText(time),
          ],
        ),
      )
    ],
  );
}

}
