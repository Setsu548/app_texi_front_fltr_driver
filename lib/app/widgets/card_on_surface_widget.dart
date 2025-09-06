import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';

class CardOnSurface extends StatelessWidget {
  final List<Widget> children;
  final Color? backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;
  final EdgeInsetsGeometry padding; 

  const CardOnSurface({
    super.key,
    required this.children,
    this.backgroundColor,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.padding = const EdgeInsets.all(30), 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.zero,
        color: backgroundColor ?? lightColorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: padding, 
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          ),
        ),
      ),
    );
  }
}
