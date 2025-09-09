import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/card_on_surface_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/driver_info_secondary_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/info_tile_flat_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_chip_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/outlined_small_button_widget.dart';
import 'package:app_texi_fltr_driver/app/widgets/primary_small_button_widget.dart';
import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TravelRequest extends HookWidget {
  final String originTime;
  final String originDescription;
  final String destinationDescription;
  final VoidCallback onPressedDetail;
  final String distance;
  final String estimatedTime;
  final String earnings;
  final String avatarUrl;
  final String nameDriver;
  final double ratingDriver;
  final VoidCallback onPressedAccept;

  const TravelRequest({
    super.key,
    required this.originTime,
    required this.originDescription,
    required this.destinationDescription,
    required this.onPressedDetail,
    required this.distance,
    required this.estimatedTime,
    required this.earnings,
    required this.avatarUrl,
    required this.nameDriver,
    required this.ratingDriver,
    required this.onPressedAccept
  });

  @override
  Widget build(BuildContext context) {

    return CardOnSurface(
      backgroundColor: lightColorScheme.secondary,
      padding: EdgeInsetsGeometry.all(20),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InfoTileFlat(
                icon: Icons.send, 
                colorIcon: lightColorScheme.surfaceVariant,
                title: context.intl.labelTextPickup, 
                description: originDescription
              ),
            ),
            SizedBox(width: 10),
            LabelChip(text: originTime)
          ],
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: InfoTileFlat(
                icon: Icons.send, 
                colorIcon: lightColorScheme.surfaceVariant,
                title: context.intl.labelTextDestination, 
                description: destinationDescription
              ),
            ),
            OutlinedSmallButton(text: context.intl.labelTextDetail, onPressed: onPressedDetail),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                LabelText(context.intl.labelTextDistance),
                BodyText(distance)
              ],
            ),
            Column(
              children: [
                LabelText(context.intl.labelTextEstimatedTime),
                BodyText(estimatedTime)
              ],
            ),
            Column(
              children: [
                LabelText(context.intl.labelTextEarnings),
                BodyText(earnings, color: lightColorScheme.surfaceVariant)
              ],
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: DriverInfoSecondary(
                avatarUrl: avatarUrl,
                personName: nameDriver,
                rating: ratingDriver,
              ),
            ),
            PrimarySmallButton(text: context.intl.commonAccept, onPressed: onPressedAccept)
          ],
        ),
      ]
    );
  }
}
