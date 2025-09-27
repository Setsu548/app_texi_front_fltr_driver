import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import '../widgets/body_text_widget.dart';
import '../widgets/label_text_widget.dart';

class FilterDateField extends StatelessWidget {
  const FilterDateField({
    super.key,
    required this.label,
    required this.dateText,
    required this.onTap,
    this.icon = Icons.calendar_month_outlined,
  });

  final String label;
  final String dateText;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label),
          SizedBox(height: 10),
          InkWell(
            onTap: onTap,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: lightColorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: lightColorScheme.onSurface),
              ),
              child: Row(
                children: [
                  Icon(icon, size: 20, color: lightColorScheme.onSurface),
                  SizedBox(width: 10),
                  BodyText(dateText),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
