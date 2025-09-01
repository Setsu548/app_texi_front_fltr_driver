import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'label_text_widget.dart';

class RadioGroupRow extends HookWidget {
  final List<String> options;
  final String label;
  final String? initialValue;

  const RadioGroupRow({
    super.key,
    required this.label,
    required this.options,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<String?>(initialValue);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label),
          const SizedBox(height: 6),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: options.map((option) {
                return GestureDetector(
                  onTap: () => selectedValue.value = option,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: selectedValue.value,
                        onChanged: (value) => selectedValue.value = value,
                      ),
                      LabelText(option),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
