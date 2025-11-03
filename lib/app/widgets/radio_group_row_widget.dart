import 'package:app_texi_fltr_driver/theme/main_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'label_text_widget.dart';

class RadioGroupRow extends HookWidget {
  final List<String> options;
  final String label;
  final Color? colorLabel;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const RadioGroupRow({
    super.key,
    required this.label,
    this.colorLabel,
    required this.options,
    this.initialValue,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<String?>(initialValue);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label, color: colorLabel),
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
                        onChanged: (value) {
                          selectedValue.value = value;
                          if (onChanged != null) onChanged!(option);
                        },
                        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                          if (states.contains(MaterialState.selected)) {
                            return lightColorScheme.primary; 
                          }
                          return lightColorScheme.surface;
                        }),
                      ),
                      LabelText(option, color: colorLabel),
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
