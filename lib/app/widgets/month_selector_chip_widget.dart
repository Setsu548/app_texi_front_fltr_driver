import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';

class MonthSelectorChip extends StatelessWidget {
  const MonthSelectorChip({
    super.key,
    required this.label,
    required this.onTap,
    this.icon = Icons.calendar_month_rounded,
    this.showChevron = true,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
  });

  final String label;
  final VoidCallback onTap;
  final IconData icon;
  final bool showChevron;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final fg = foregroundColor ?? lightColorScheme.primary;
    final bg = backgroundColor ?? lightColorScheme.secondaryContainer;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: fg),
            const SizedBox(width: 6),
            BodyText(label, color: fg),
            if (showChevron) ...[
              const SizedBox(width: 4),
              Icon(Icons.arrow_drop_down_rounded, size: 18, color: fg),
            ],
          ],
        ),
      ),
    );
  }
}
