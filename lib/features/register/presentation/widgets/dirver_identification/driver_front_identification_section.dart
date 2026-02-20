import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/features/register/presentation/providers/driver_identity_provider.dart';

class DriverFrontIdentificationSection extends ConsumerStatefulWidget {
  const DriverFrontIdentificationSection({super.key});

  @override
  ConsumerState<DriverFrontIdentificationSection> createState() =>
      _DriverFrontIdentificationSectionState();
}

class _DriverFrontIdentificationSectionState
    extends ConsumerState<DriverFrontIdentificationSection> {
  void _showPickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(galleryText.i18n),
                onTap: () {
                  ref
                      .read(frontIdentificationProvider.notifier)
                      .pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text(cameraText.i18n),
                onTap: () {
                  ref
                      .read(frontIdentificationProvider.notifier)
                      .pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(frontIdentificationProvider);
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
            onPressed: () => _showPickerOptions(context),
          ),
        ),
      ],
    );
  }
}
