import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/router/app_router.dart';
import 'package:texi_driver/core/widgets/another_elevated_button_widget.dart';
import 'package:texi_driver/core/widgets/custom_snack_bar.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_identity_provider.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/driver_license/driver_back_license_widget.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/driver_license/driver_category_license_dropdown_widget.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/driver_license/driver_expiration_license.dart';
import 'package:texi_driver/core/widgets/loading_screen.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_form_provider.dart';
import 'package:texi_driver/features/register_driver/presentation/widgets/driver_license/driver_front_license_widget.dart';
import 'package:texi_driver/features/register_driver/services/register_services.dart';

class DriverLicensePage extends ConsumerStatefulWidget {
  const DriverLicensePage({super.key});

  @override
  ConsumerState<DriverLicensePage> createState() => _DriverLicensePageState();
}

class _DriverLicensePageState extends ConsumerState<DriverLicensePage> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final driverRegisterState = ref.watch(driverRegisterProccessProvider);

    return Stack(
      children: [
        Scaffold(
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
                      width: 90.w,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 5.sp,
                          color: Theme.of(
                            context,
                          ).colorScheme.secondary.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            DriverCategoryLicenseDropdownWidget(),
                            SizedBox(height: 2.h),
                            DriverExpirationLicense(controller: controller),
                          ],
                        ),
                      ),
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
                      child: SizedBox(
                        width: 80.w,
                        child: DriverFrontLicenseWidget(),
                      ),
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
                      child: SizedBox(
                        width: 80.w,
                        child: DriverBackLicenseWidget(),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    ElevatedButtonWidget(
                      label: continueButton.i18n,
                      iconImageAfter: Icon(Icons.chevron_right),
                      onPressed: () async {
                        if (ref.read(frontLicenseProvider).value != null &&
                            ref.read(backLicenseProvider).value != null &&
                            ref.read(profileImageProvider).value != null) {
                          try {
                            await RegisterServices.registerDriverInformation(
                              ref,
                            );
                            if (context.mounted) {
                              context.go(AppRouter.initialLocation);
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                customSnackBar(e.toString(), context),
                              );
                            }
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar(selectAllPhotos.i18n, context),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 2.h),
                    AnotherElevatedButtonWidget(
                      label: continueLater.i18n,
                      onPressed: () => context.pop(),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (driverRegisterState.isLoading) const LoadingScreen(),
      ],
    );
  }
}
