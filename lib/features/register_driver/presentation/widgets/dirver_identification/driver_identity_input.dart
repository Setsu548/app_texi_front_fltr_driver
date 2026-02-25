import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';

class DriverIdentityInput extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController idController;
  const DriverIdentityInput({
    super.key,
    required this.idController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          identificationNumber.i18n,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 15.5.sp,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.tertiary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: TextFormField(
            controller: idController,
            validator: validator,
            decoration: InputDecoration(
              hintText: identificationNumberDescription.i18n,
              hintStyle: TextStyle(
                color: Theme.of(
                  context,
                ).colorScheme.secondary.withValues(alpha: 0.5),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
            ),
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          identificationText.i18n,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.onSurface.withAlpha(120),
          ),
        ),
      ],
    );
  }
}
