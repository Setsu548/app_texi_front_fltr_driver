import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/utils/dates_utilities.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/features/register_driver/presentation/providers/driver_identity_provider.dart';

class DriverExpirationDate extends ConsumerWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const DriverExpirationDate({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(idExpirationDateProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          expirationDate.i18n,
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
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            readOnly: true,
            validator: validator,
            onTap: () async {
              final pickedDate = await showDatePicker(
                context: context,
                initialDate: date,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (!context.mounted) return;

              if (pickedDate != null &&
                  pickedDate.isAfter(date.add(const Duration(days: 90)))) {
                ref
                    .read(idExpirationDateProvider.notifier)
                    .setExpirationDate(pickedDate);
                controller.text = DatesUtilities.formatDate(pickedDate);
              } else {
                controller.clear();
                ref.invalidate(idExpirationDateProvider);
                ScaffoldMessenger.of(context).showSnackBar(
                  customSnackBar(exipirationDateWarning.i18n, context),
                );
              }
            },
            decoration: InputDecoration(
              hintText: DatesUtilities.formatDate(date),
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
          expirationDateMessage.i18n,
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
