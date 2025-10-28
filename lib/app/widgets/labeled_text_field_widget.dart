import 'package:flutter/material.dart';
import '../../theme/main_theme.dart';
import 'label_text_widget.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final Color? colorLabel;
  final Color? colorPrefix;
  final String hint;
  final TextInputType keyboardType;
  final String? prefixText; 
  final TextEditingController? controller;


  const LabeledTextField({
    super.key,
    required this.label,
    this.colorLabel,
    required this.hint,
    this.colorPrefix,
    this.keyboardType = TextInputType.text,
    this.prefixText,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelText(label, color: colorLabel),
          const SizedBox(height: 6),
          Row(
            children: [
              if (prefixText != null) ...[ 
                Text(
                  prefixText!,
                  style: TextStyle(
                    color: colorPrefix ?? lightColorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 8), 
              ],
              Expanded(
                child: TextField(
                  controller: controller,
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
