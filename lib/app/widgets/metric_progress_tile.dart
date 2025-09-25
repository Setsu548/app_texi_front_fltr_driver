import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/label_text_widget.dart';

class MetricProgressTile extends StatelessWidget {
  const MetricProgressTile({
    super.key,
    required this.title,           
    required this.progress,       
    required this.deltaText,       
    this.deltaIcon = Icons.north_east, 
    this.barColor,
    this.trackColor,
    this.deltaColor,
    this.height = 10,
  });

  final String title;
  final double progress;
  final String deltaText;
  final IconData deltaIcon;
  final Color? barColor;
  final Color? trackColor;
  final Color? deltaColor;
  final double height;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final Color effectiveBar = barColor ?? lightColorScheme.primary;
    final Color effectiveTrack = trackColor ?? scheme.secondaryContainer;
    final Color effectiveDelta = deltaColor ?? lightColorScheme.surfaceDim;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelText(title), 
            Row(
              children: [
                LabelText(deltaText, color: effectiveDelta),
                SizedBox(width: 5),
                Icon(deltaIcon, size: 14, color: effectiveDelta),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(height),
          child: Stack(
            children: [
              Container(height: height, color: effectiveTrack),
              FractionallySizedBox(
                widthFactor: progress.clamp(0.0, 1.0),
                child: Container(height: height, color: effectiveBar),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
