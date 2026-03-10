import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/router/app_router.dart';
import 'package:texi/core/utils/dates_utilities.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi/features/register_driver/presentation/providers/driver_form_provider.dart';
import 'package:texi/features/register_driver/presentation/widgets/confirmation_message.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_user/driver_info_widget.dart';
import 'package:texi/features/register_driver/services/register_services.dart';

class ConfirmationDriverData extends ConsumerWidget {
  final DriverEntity driver;
  const ConfirmationDriverData({required this.driver, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.watch(genderProvider);
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              vertical: 2.5.h,
              horizontal: 5.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DriverFormHeaderWidget(
                  title: confirmation.i18n,
                  description: confirmationDescription.i18n,
                ),
                SizedBox(height: 2.85.h),
                Container(
                  width: 85.w,
                  height: 38.75.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 2.3.h,
                    horizontal: 2.3.h,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      DriverInfoWidget(
                        text: '${driver.firstName} ${driver.lastName}',
                        icon: Icons.person,
                      ),
                      SizedBox(height: 2.5.h),
                      DriverInfoWidget(text: driver.email, icon: Icons.email),
                      SizedBox(height: 2.5.h),
                      DriverInfoWidget(
                        text: driver.phoneNumber,
                        icon: Icons.phone_android,
                      ),
                      SizedBox(height: 1.5.h),
                      DriverInfoWidget(text: driver.address, icon: Icons.home),
                      SizedBox(height: 1.5.h),
                      DriverInfoWidget(
                        text: DatesUtilities.formatDate(driver.birthDate),
                        icon: Icons.cake,
                      ),
                      SizedBox(height: 1.5.h),
                      DriverInfoWidget(
                        text: gender.genders,
                        icon: Icons.family_restroom,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 3.h),
                ConfirmationMessage(),
                SizedBox(height: 3.h),
                ElevatedButtonWidget(
                  iconImageAfter: const Icon(Icons.chevron_right),
                  label: continueButton.i18n,
                  onPressed: () async {
                    if (await RegisterServices.registerLocalDriver(driver)) {
                      if (context.mounted) {
                        _showMessage(context, driverSavedLocally.i18n);
                        context.go(
                          '${AppRouter.registerHomeLocation}/${AppRouter.registerIdentityLocation}',
                        );
                      }
                    } else {
                      if (context.mounted) {
                        _showMessage(context, errorSavingDriver.i18n);
                      }
                    }
                  },
                ),
                SizedBox(height: 1.5.h),
                AnotherElevatedButtonWidget(
                  iconImageBefore: const Icon(Icons.chevron_left),
                  label: comeback.i18n,
                  onPressed: () => context.pop(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(customSnackBar(message, context));
  }
}
