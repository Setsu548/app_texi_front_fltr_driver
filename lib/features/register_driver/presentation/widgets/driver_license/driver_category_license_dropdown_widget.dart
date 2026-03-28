import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_identity_provider.dart';

class DriverCategoryLicenseDropdownWidget extends ConsumerStatefulWidget {
  const DriverCategoryLicenseDropdownWidget({super.key});

  @override
  ConsumerState<DriverCategoryLicenseDropdownWidget> createState() =>
      _DriverCategoryLicenseDropdownWidgetState();
}

class _DriverCategoryLicenseDropdownWidgetState
    extends ConsumerState<DriverCategoryLicenseDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    final documentTypes = ref.watch(documentTypesProvider);
    final selectedDocumentType = ref.watch(selectedDocumentTypeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          categoryLicense.i18n,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 15.5.sp,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 65.w,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.tertiary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Center(
            child: documentTypes.when(
              data: (data) {
                return DropdownButton(
                  underline: SizedBox(),
                  value: selectedDocumentType,
                  hint: Text(
                    category.i18n,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  items: data.map((documentType) {
                    return DropdownMenuItem(
                      value: documentType,
                      child: Text(documentType.documentTypeName),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      ref
                          .read(selectedDocumentTypeProvider.notifier)
                          .setSelectedDocumentType(value!);
                    });
                  },
                );
              },
              error: (error, stackTrace) {
                return Text(error.toString());
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            ),
          ),
        ),
        SizedBox(height: .75.h),
        Text(
          categoryLicenseDescription.i18n,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.5),
            fontSize: 13.75.sp,
          ),
        ),
      ],
    );
  }
}
