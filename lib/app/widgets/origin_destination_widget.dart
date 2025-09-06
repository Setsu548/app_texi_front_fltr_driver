import 'package:app_texi_fltr_driver/app/widgets/label_text_widget.dart';
import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';

class OriginDestination extends StatelessWidget {
  final String originDescription;
  final String originDestination;

  const OriginDestination({
    super.key,
    required this.originDescription,
    required this.originDestination,
  });

  @override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, color: lightColorScheme.surfaceVariant, size: 20),
          SizedBox(width: 10),
          Expanded(child: LabelText(originDescription))
        ],
      ),
      SizedBox(height: 10),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.send, color: lightColorScheme.surfaceVariant, size: 20),
          SizedBox(width: 10),
          Expanded(child: LabelText(originDestination))
        ],
      )
    ],
  );
}

}
