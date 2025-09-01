import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;

  const SmallText(
    this.text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10
      )
    );
  }
}