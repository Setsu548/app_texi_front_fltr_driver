import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'label_text_widget.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType keyboardType;
  final String? prefixText; 

  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType = TextInputType.text,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label),
          const SizedBox(height: 6),
          Row(
            children: [
              if (prefixText != null) ...[ 
                Text(
                  prefixText!,
                  style: TextStyle(
                    color: lightColorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8), 
              ],
              Expanded(
                child: TextField(
                  cursorColor: lightColorScheme.secondaryContainer,
                  style: TextStyle(color: lightColorScheme.surface),
                  maxLength: 50,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: lightColorScheme.secondaryContainer,
                    ),
                    fillColor: lightColorScheme.surfaceTint,
                    hintText: hint,
                    counterText: '',
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: lightColorScheme.outline,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: lightColorScheme.outline,
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
