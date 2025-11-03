import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../theme/main_theme.dart';
import 'label_text_widget.dart';

class LabeledDropdown<T> extends HookWidget {
  final String label;
  final Color? colorLabel;
  final String hint;
  final List<DropdownMenuItem<T>> items;
  final Function(T?)? onChanged;
  final FormFieldValidator<T>? validator;

  const LabeledDropdown({
    super.key,
    required this.label,
    this.colorLabel,
    required this.hint,
    required this.items,
    required this.onChanged,
    this.validator
  });

  @override
  Widget build(BuildContext context) {

    final selectedValue = useState<T?>(null);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label, color: colorLabel),
          const SizedBox(height: 6),
          DropdownButtonFormField<T>(
            value: selectedValue.value,
            validator: validator,
            onChanged: (val) {
              selectedValue.value = val;
              if (onChanged != null) {
                onChanged!(val); // 👈 Llama al callback
              }
            }, 
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
