import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/constants/enums.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';

class DriverCategoryLicenseDropdownWidget extends StatefulWidget {
  const DriverCategoryLicenseDropdownWidget({super.key});

  @override
  State<DriverCategoryLicenseDropdownWidget> createState() =>
      _DriverCategoryLicenseDropdownWidgetState();
}

class _DriverCategoryLicenseDropdownWidgetState
    extends State<DriverCategoryLicenseDropdownWidget> {
  final licenseCategories = LicenseCategory.values;
  LicenseCategory? selectedLicenseCategory;

  @override
  Widget build(BuildContext context) {
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
          width: 35.w,
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.tertiary.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Theme.of(context).colorScheme.primary),
          ),
          child: Center(
            child: DropdownButton(
              underline: SizedBox(),
              value: selectedLicenseCategory,
              hint: Text(
                category.i18n,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              items: licenseCategories.map((licenseCategory) {
                return DropdownMenuItem(
                  value: licenseCategory,
                  child: Text('Categoria ${licenseCategory.licenseCategory}'),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLicenseCategory = value;
                });
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
