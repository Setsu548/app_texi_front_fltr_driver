import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const LabelText(
    this.text, {
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,         
    this.overflow,  
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
        color: color
      ),
      textAlign: textAlign,
      softWrap: true,
      maxLines: maxLines,       
      overflow: overflow, 
    );
  }
}