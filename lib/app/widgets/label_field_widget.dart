import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'label_text_widget.dart';

class LabelFieldWidget extends HookWidget {
  const LabelFieldWidget({
    super.key,
    required this.label,
    required this.field,
  });

  final String label;
  final Widget field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LabelText(label),
        field,
      ],
    );
  }
}