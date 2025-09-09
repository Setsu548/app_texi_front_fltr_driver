import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class TripMetrics extends StatelessWidget {
  final String distance;
  final String time;
  final String tariff;

  const TripMetrics({
    super.key,
    required this.distance,
    required this.time,
    required this.tariff,
  });

  @override
Widget build(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          LabelText(context.intl.labelTextDistance),
          Row(
            children: [
              Icon(Icons.route, color: lightColorScheme.surfaceVariant, size: 20),
              SizedBox(width: 5),
              BodyText(distance)
            ],
          )
        ],
      ),
      Column(
        children: [
          LabelText(context.intl.labelTextTime),
          Row(
            children: [
              Icon(Icons.access_time, color: lightColorScheme.surfaceVariant, size: 20),
              SizedBox(width: 5),
              BodyText(time)
            ],
          )
        ],
      ),
      Column(
        children: [
          LabelText(context.intl.labelTextTariff),
          Row(
            children: [
              Icon(Icons.payments, color: lightColorScheme.surfaceVariant, size: 20),
              SizedBox(width: 5),
              BodyText('\$85')
            ],
          )
        ],
      ),
    ],
  );
}

}
