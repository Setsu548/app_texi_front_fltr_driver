import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/router/app_router.dart';
import 'package:texi/core/utils/image_picker_service.dart';
import 'package:texi/core/utils/secure_storage_service.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/core/widgets/loading_screen.dart';
import 'package:texi/features/register_driver/domain/entities/identification_entity.dart';
import 'package:texi/features/register_driver/presentation/providers/driver_identity_provider.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_license/driver_back_license_widget.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_license/driver_category_license_dropdown_widget.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_license/driver_expiration_license.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_license/driver_front_license_widget.dart';

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
    ref.listen(driverIdentityRegistrationProvider, (previous, next) {
      if (!next.isLoading && next.hasValue && next.value != null) {
        if (next.value!.success) {
          context.push(
            '${AppRouter.registerHomeLocation}/${AppRouter.registerConfirmationLocation}',
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar(next.value!.message, context));
        }
      } else if (!next.isLoading && next.hasError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(customSnackBar(next.error.toString(), context));
      }
    });

    final isLoading = ref.watch(driverIdentityRegistrationProvider).isLoading;

    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SafeArea(
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
                          final cookie = await SecureStorageService()
                              .getDriver();
                          if (cookie != null) {
                            final license = IdentificationEntity(
                              backDocument:
                                  await ImagePickerService.imageToBase64(
                                    ref.read(backLicenseProvider).value!,
                                  ),
                              documentNumber: ref.read(
                                numeroIdentificationProvider,
                              ),
                              documentType: 6,
                              expireDate: ref.read(
                                licenseExpirationDateProvider,
                              ),
                              faceImage: await ImagePickerService.imageToBase64(
                                ref.read(profileImageProvider).value!,
                              ),
                              frontDocument:
                                  await ImagePickerService.imageToBase64(
                                    ref.read(frontLicenseProvider).value!,
                                  ),
                              uuid: cookie.uuid,
                            );
                            ref
                                .read(
                                  driverIdentityRegistrationProvider.notifier,
                                )
                                .register(license);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(errorCookie.i18n, context),
                            );
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
          if (isLoading) const LoadingScreen(),
        ],
      ),
    );
  }
}
