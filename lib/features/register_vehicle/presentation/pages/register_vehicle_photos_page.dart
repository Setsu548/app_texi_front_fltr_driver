import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/router/app_router.dart';
import 'package:texi/core/widgets/another_elevated_button_widget.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/features/register_vehicle/presentation/providers/vehicle_info_provider.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/photo_card.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/vehicle_register_header.dart';
import 'package:texi/features/register_vehicle/presentation/widgets/warning_banner.dart';
import 'package:texi/features/register_vehicle/services/parser.dart';
import 'package:texi/core/widgets/loading_screen.dart';

class RegisterVehiclePhotosPage extends ConsumerWidget {
  const RegisterVehiclePhotosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicleFrontPhoto = ref.watch(vehicleFrontPhotoProvider).value;
    final vehicleLeftSidePhoto = ref.watch(vehicleLeftSidePhotoProvider).value;
    final vehicleRightSidePhoto = ref
        .watch(vehicleRightSidePhotoProvider)
        .value;
    final vehicleBackSidePhoto = ref.watch(vehicleBackSidePhotoProvider).value;
    final vehicleImagesSavingState = ref.watch(vehicleImagesSavingProvider);

    ref.listen<AsyncValue>(vehicleImagesSavingProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          _showMessage(context, error.toString());
        },
        data: (data) {
          if (data != null && data.success) {
            //TODO: Implement register confirmation
            _navigate(context);
            _showMessage(context, data.message!);
          }
        },
      );
    });

    return Stack(
      children: [
        Scaffold(
          appBar: null,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VehicleRegisterHeader(
                    title: vehiclePhotos.i18n,
                    description: vehiclePhotosDescription.i18n,
                  ),
                  SizedBox(height: 2.5.h),
                  Center(child: WarningBanner()),
                  SizedBox(height: 3.h),
                  PhotoCard(
                    key: const ValueKey('vehicleFront'),
                    title: vehicleFront.i18n,
                    icon: Icons.directions_car_outlined,
                    imageFile: vehicleFrontPhoto,
                    onPickImage: () => ref
                        .read(vehicleFrontPhotoProvider.notifier)
                        .pickImage(ImageSource.camera),
                  ),
                  SizedBox(height: 2.h),
                  PhotoCard(
                    key: const ValueKey('vehicleLeftSide'),
                    title: vehicleLeftSide.i18n,
                    icon: Icons.view_sidebar_outlined,
                    imageFile: vehicleLeftSidePhoto,
                    onPickImage: () => ref
                        .read(vehicleLeftSidePhotoProvider.notifier)
                        .pickImage(ImageSource.camera),
                  ),
                  SizedBox(height: 2.h),
                  PhotoCard(
                    key: const ValueKey('vehicleRightSide'),
                    title: vehicleRightSide.i18n,
                    icon: Icons.view_sidebar_outlined,
                    imageFile: vehicleRightSidePhoto,
                    onPickImage: () => ref
                        .read(vehicleRightSidePhotoProvider.notifier)
                        .pickImage(ImageSource.camera),
                  ),
                  SizedBox(height: 2.h),
                  PhotoCard(
                    key: const ValueKey('vehicleBackSide'),
                    title: vehicleBackSide.i18n,
                    icon: Icons.airport_shuttle_outlined,
                    imageFile: vehicleBackSidePhoto,
                    onPickImage: () => ref
                        .read(vehicleBackSidePhotoProvider.notifier)
                        .pickImage(ImageSource.camera),
                  ),
                  SizedBox(height: 4.h),
                  ElevatedButtonWidget(
                    label: continueButton.i18n,
                    onPressed: () async {
                      if (vehicleFrontPhoto != null &&
                          vehicleLeftSidePhoto != null &&
                          vehicleRightSidePhoto != null &&
                          vehicleBackSidePhoto != null) {
                        final imagesParsed = await Parser.parseVehicleImages(
                          vehicleFrontPhoto,
                          vehicleLeftSidePhoto,
                          vehicleRightSidePhoto,
                          vehicleBackSidePhoto,
                        );
                        await ref
                            .read(vehicleImagesSavingProvider.notifier)
                            .saveVehicleImages(imagesParsed);
                      }
                    },
                    width: 90.w,
                  ),
                  SizedBox(height: 1.5.h),
                  AnotherElevatedButtonWidget(
                    label: continueLater.i18n,
                    onPressed: () {
                      // TODO: Implement continue later
                    },
                    width: 90.w,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (vehicleImagesSavingState.isLoading) const LoadingScreen(),
      ],
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(customSnackBar(message, context));
  }

  void _navigate(BuildContext context) {
    context.go(AppRouter.initialLocation);
  }
}
