import 'package:app_texi_fltr_driver/l10n/l10n_extension.dart';
import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';
import '../widgets/card_on_surface_widget.dart';

class BonusProgressCard extends StatelessWidget {
  const BonusProgressCard({
    super.key,
    required this.title,                 
    required this.amountText,            
    required this.description,           
    required this.completed,             
    required this.goal,                  
    this.statusText,
    this.padding = const EdgeInsets.all(16),
    this.barHeight = 10,
    this.statusColor,
    this.amountColor,
    this.barColor,
    this.trackColor,
  });

  final String title;
  final String amountText;
  final String description;
  final int completed;
  final int goal;
  final String? statusText;
  final EdgeInsets padding;
  final double barHeight;
  final Color? statusColor;
  final Color? amountColor;
  final Color? barColor;
  final Color? trackColor;

  @override
  Widget build(BuildContext context) {
    final progress =
        goal > 0 ? (completed / goal).clamp(0.0, 1.0) : 0.0;

    final Color cAmount = amountColor ?? lightColorScheme.primary;
    final Color cStatus = statusColor ?? lightColorScheme.surfaceDim;
    final Color cBar = barColor ?? lightColorScheme.primary;
    final Color cTrack = trackColor ?? lightColorScheme.secondaryContainer;

    return CardOnSurface(
      backgroundColor: lightColorScheme.secondary,
      padding: padding,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(title),
            BodyText(amountText, color: cAmount),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: LabelText(
                description,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LabelText('$completed/$goal', color: cStatus),
                LabelText(statusText ?? context.intl.statusDriverBonusesCompleted, color: cStatus),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(barHeight),
          child: Stack(
            children: [
              Container(height: barHeight, color: cTrack),
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(height: barHeight, color: cBar),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
