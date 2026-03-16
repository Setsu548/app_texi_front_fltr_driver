import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/widgets/elevated_button_widget.dart';
import 'package:texi_driver/core/widgets/modal_options_image_picker.dart';
import 'package:texi_driver/features/register_driver/presentation/providers/driver_identity_provider.dart';

class DriverBackLicenseWidget extends ConsumerStatefulWidget {
  const DriverBackLicenseWidget({super.key});

  @override
  ConsumerState<DriverBackLicenseWidget> createState() =>
      _DriverBackLicenseWidgetState();
}

class _DriverBackLicenseWidgetState
    extends ConsumerState<DriverBackLicenseWidget> {
  void showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.surface,
      context: context,
      builder: (BuildContext bc) {
        return ModalOptionsImagePicker(
          options: [
            ModalOptionImage(
              icon: Icons.photo_library,
              title: galleryText.i18n,
              onTap: () {
                ref
                    .read(backLicenseProvider.notifier)
                    .pickImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ModalOptionImage(
              icon: Icons.photo_camera,
              title: cameraText.i18n,
              onTap: () {
                ref
                    .read(backLicenseProvider.notifier)
                    .pickImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(backLicenseProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        image.when(
          data: (data) {
            if (data == null) {
              return SizedBox(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(1.5.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(
                          context,
                        ).colorScheme.secondary.withValues(alpha: 0.2),
                      ),
                      child: Icon(
                        Icons.badge,
                        size: 25.sp,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    SizedBox(height: 2.75.h),
                    Text(
                      frontIdentification.i18n,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.6.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    SizedBox(height: 0.7.h),
                    Text(
                      identificationMessage.i18n,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.6.sp,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha(120),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Container(
              width: 60.w,
              height: 37.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(data),
                  fit: BoxFit.fitWidth,
                ),
              ),
            );
          },
          error: (error, stack) {
            return const SizedBox.shrink();
          },
          loading: () {
            return const SizedBox.shrink();
          },
        ),
        SizedBox(height: 2.75.h),
        SizedBox(
          width: 50.w,
          child: ElevatedButtonWidget(
            label: takeAPhoto.i18n,
            onPressed: () => showPickerOptions(context),
          ),
        ),
      ],
    );
  }
}
