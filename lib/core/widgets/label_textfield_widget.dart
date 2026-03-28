import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class LabelTextfieldWidget extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextCapitalization textCapitalization;
  final String? hintText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool multipleLines;
  final bool? readOnly;
  final bool? isBold;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const LabelTextfieldWidget({
    super.key,
    required this.label,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.validator,
    this.obscureText = false,
    this.multipleLines = false,
    this.readOnly = false,
    this.isBold = false,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onTap,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 1.15.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2.45.w),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.tertiary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.45),
              width: 1.25,
            ),
          ),
          child: Center(
            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              textCapitalization: textCapitalization,
              maxLines: multipleLines ? 5 : 1,
              readOnly: readOnly!,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              style: TextStyle(
                color: Colors.white,
                fontWeight: isBold! ? FontWeight.bold : FontWeight.normal,
              ),
              onChanged: onChanged,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                suffixIcon: suffixIcon,
                hintStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                ),
                errorStyle: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              validator: validator,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
