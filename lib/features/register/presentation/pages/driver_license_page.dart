import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_back_license_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_category_license_dropdown_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register/presentation/widgets/driver_front_license_widget.dart';

class DriverLicensePage extends StatelessWidget {
  const DriverLicensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DriverFormHeaderWidget(
                  title: licenseVerification.i18n,
                  description: licenseVerificationDescription.i18n,
                ),
                SizedBox(height: 2.h),
                Container(
                  width: 85.w,
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 5.sp,
                      color: Theme.of(
                        context,
                      ).colorScheme.secondary.withValues(alpha: 0.5),
                    ),
                  ),
                  child: DriverCategoryLicenseDropdownWidget(),
                ),
                SizedBox(height: 2.h),
                DottedBorder(
                  options: RectDottedBorderOptions(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    dashPattern: [8, 4],
                    strokeWidth: 5.sp,
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withValues(alpha: 0.5),
                  ),
                  child: DriverFrontLicenseWidget(),
                ),
                SizedBox(height: 2.h),
                DottedBorder(
                  options: RectDottedBorderOptions(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: 2.h,
                    ),
                    dashPattern: [8, 4],
                    strokeWidth: 5.sp,
                    color: Theme.of(
                      context,
                    ).colorScheme.secondary.withValues(alpha: 0.5),
                  ),
                  child: DriverBackLicenseWidget(),
                ),
                SizedBox(height: 2.h),
                ElevatedButtonWidget(
                  label: continueButton.i18n,
                  iconImageAfter: Icon(Icons.chevron_right),
                  onPressed: () {
                    context.go('/registerHome/confirmation');
                  },
                ),
                SizedBox(height: 2.h),
                AnotherElevatedButtonWidget(
                  label: continueLater.i18n,
                  onPressed: () {},
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
