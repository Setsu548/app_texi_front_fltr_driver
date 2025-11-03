import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';

class VehicleCardWidget extends StatelessWidget {
  const VehicleCardWidget({
    
    super.key,
    required this.dateText,
    required this.priceText,
    required this.originDescription,
    required this.destinationDescription,
    this.statusText,
    this.statusColor,
  });

  final String dateText;
  final String priceText;
  final String originDescription;
  final String destinationDescription;
  final String? statusText;
  final Color? statusColor; 

  @override
  Widget build(BuildContext context) {
    return CardOnSurface(
      backgroundColor: lightColorScheme.secondary,
      padding: EdgeInsets.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(dateText, color: lightColorScheme.primary),
            BodyText(priceText, color: lightColorScheme.primary),
          ],
        ),
        SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.circle, size: 18, color: lightColorScheme.surfaceDim),
            SizedBox(width: 10),
            Expanded(child: BodyText(originDescription)),
          ],
        ),
        SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: BodyText(destinationDescription)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor ?? lightColorScheme.surfaceDim,
                borderRadius: BorderRadius.circular(12),
              ),
              child: LabelText(statusText ?? context.intl.statusTripCompleted)
            ),
          ],
        ),
      ],
    );
  }
}
