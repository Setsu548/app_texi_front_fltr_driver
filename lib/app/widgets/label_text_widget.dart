import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;

  const LabelText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge,
      softWrap: true,
    );
  }
}