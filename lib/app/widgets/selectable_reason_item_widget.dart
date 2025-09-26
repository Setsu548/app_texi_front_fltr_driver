import 'package:app_texi_fltr_driver/app/widgets/body_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class SelectableReasonItem extends StatelessWidget {
  const SelectableReasonItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    this.fullWidth = true,
    this.selectedBg,
    this.unselectedBg,
    this.selectedBorder,
    this.unselectedBorder,
    this.selectedTextColor,
    this.unselectedTextColor,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool fullWidth;

  final Color? selectedBg;
  final Color? unselectedBg;
  final Color? selectedBorder;
  final Color? unselectedBorder;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;

  @override
  Widget build(BuildContext context) {
    final bg = isSelected
        ? (selectedBg ?? lightColorScheme.primary)
        : (unselectedBg ?? lightColorScheme.secondary);
    final tx = isSelected
        ? (selectedTextColor ?? lightColorScheme.surface)
        : (unselectedTextColor ?? lightColorScheme.onSurface);

    final child = InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: BodyText(text, color: tx),
      ),
    );

    return fullWidth ? SizedBox(width: double.infinity, child: child) : child;
  }
}
