import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../theme/main_theme.dart';
import 'label_text_widget.dart';

class LabeledDropdown<T> extends HookWidget {
  final String label;
  final String hint;
  final List<DropdownMenuItem<T>> items;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {

    final selectedValue = useState<T?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label),
          const SizedBox(height: 6),
          DropdownButtonFormField<T>(
            value: selectedValue.value,
            onChanged: (val) => selectedValue.value = val, 
            items: items,
            decoration: InputDecoration(
              hintText: hint,
              fillColor: lightColorScheme.surfaceTint,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: lightColorScheme.outline),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: lightColorScheme.outline),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: lightColorScheme.outline,
                  width: 1,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: lightColorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: lightColorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: lightColorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: lightColorScheme.secondaryContainer
            ),
            dropdownColor: lightColorScheme.surfaceTint,
          ),
        ],
      ),
    );
  }
}
