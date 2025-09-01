import 'package:flutter/material.dart';

class BodyTextBold extends StatelessWidget {
  final String text;

  const BodyTextBold(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final baseStyle = Theme.of(context).textTheme.bodyLarge;

    return Text(
      text,
      style: baseStyle?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}