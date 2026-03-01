import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/widgets/loading_screen.dart';
import 'package:texi/core/widgets/modal_options_image_picker.dart';
import 'package:texi/features/register_vehicle/presentation/providers/vehicle_info_provider.dart';

class VehicleTittlePhotoSelector extends ConsumerWidget {
  const VehicleTittlePhotoSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclePhoto = ref.watch(vehiclePhotoProvider);
    return vehiclePhoto.when(
      data: (data) {
        if (data == null) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ModalOptionsImagePicker(
                  options: [
                    ModalOptionImage(
                      icon: Icons.camera_alt,
                      title: cameraText.i18n,
                      onTap: () {
                        ref
                            .read(vehiclePhotoProvider.notifier)
                            .pickImage(ImageSource.camera);
                      },
                    ),
                    ModalOptionImage(
                      icon: Icons.photo,
                      title: galleryText.i18n,
                      onTap: () {
                        ref
                            .read(vehiclePhotoProvider.notifier)
                            .pickImage(ImageSource.gallery);
                      },
                    ),
                  ],
                ),
              );
            },
            child: Container(
              height: 20.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.tertiary.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withValues(alpha: 0.35),
                  width: 1.75,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.cloud_upload_outlined,
                      color: Theme.of(context).colorScheme.primary,
                      size: 10.w,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      uploadPhoto.i18n,
                      style: TextStyle(
                        color: Colors.blue[300],
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      jpgPngLimit.i18n,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            height: 20.h,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(data),
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        }
      },
      loading: () => const LoadingScreen(),
      error: (error, stack) => Center(child: Text(error.toString())),
    );
  }
}
