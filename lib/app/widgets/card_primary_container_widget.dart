import 'package:flutter/material.dart';

import '../../theme/main_theme.dart';

class CardPrimaryContainer extends StatelessWidget {
  final List<Widget> children;
  final Color? backgroundColor;

  const CardPrimaryContainer({
    super.key,
    this.backgroundColor,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: backgroundColor ?? lightColorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      ),
    );
  }
}