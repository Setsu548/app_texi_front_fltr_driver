import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'label_text_widget.dart';

class RadioGroup extends HookWidget {
  final List<String> options; 
  final String label;
  final String? initialValue; 

  const RadioGroup({
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
          Wrap(
            children: options.map((option) {
              return SizedBox(
                // Ancho de la pantalla | Numero de Columna | Margen
                width: (MediaQuery.of(context).size.width / 4) - 24,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Radio<String>(
                      value: option,
                      groupValue: selectedValue.value,
                      onChanged: (value) {
                        selectedValue.value = value;
                      },
                    ),
                    LabelText(option),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
