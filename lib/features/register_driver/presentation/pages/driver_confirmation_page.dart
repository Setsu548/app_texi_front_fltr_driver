import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:texi/core/constants/storage_keys.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/router/app_router.dart';
import 'package:texi/core/utils/auth_secure_storeage_service.dart';
import 'package:texi/core/widgets/custom_snack_bar.dart';
import 'package:texi/core/widgets/elevated_button_widget.dart';
import 'package:texi/core/widgets/loading_screen.dart';
import 'package:texi/features/register_driver/data/models/driver_data_res_model.dart';
import 'package:texi/features/register_driver/presentation/providers/driver_identity_provider.dart';
import 'package:texi/features/register_driver/presentation/widgets/confirmation_message.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_form_header_widget.dart';
import 'package:texi/features/register_driver/presentation/widgets/driver_resume_info.dart';

class DriverConfirmationPage extends ConsumerWidget {
  const DriverConfirmationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storage = GetIt.instance<AuthSecureStorageService>();
    // Escuchamos el estado para manejar errores o éxitos
    ref.listen(driverConfirmationProvider, (previous, next) {
      if (!next.isLoading && next.hasValue && next.value != null) {
        if (next.value!.success) {
          // Elimina la cookie del usuario
          storage.deleteString(StorageKeys.driverRegister);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar(confirmationSuccess.i18n, context));
          context.go(AppRouter.initialLocation);
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

    final isLoading = ref.watch(driverConfirmationProvider).isLoading;

    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 12.75.w,
                    height: 12.75.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: Icon(Icons.verified_user, size: 20.sp),
                  ),
                  SizedBox(height: 2.h),
                  DriverFormHeaderWidget(
                    title: driverConfirmation.i18n,
                    description: driverConfirmationDescription.i18n,
                    isCenter: true,
                  ),
                  SizedBox(height: 2.h),
                  DriverResumeInfo(),
                  SizedBox(height: 2.h),
                  ElevatedButtonWidget(
                    label: sendRequest.i18n,
                    iconImageAfter: const Icon(Icons.chevron_right),
                    onPressed: () async {
                      final token = await storage.getString(
                        StorageKeys.driverRegister,
                      );
                      if (token == null) {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          customSnackBar(errorCookie.i18n, context),
                        );
                        return;
                      }
                      final tokenDecoded = DriverDataModel.fromRawJson(token);
                      ref
                          .read(driverConfirmationProvider.notifier)
                          .confirm(tokenDecoded.uuid);
                    },
                  ),
                  SizedBox(height: 2.h),
                  const ConfirmationMessage(),
                ],
              ),
            ),
          ),
          if (isLoading) const LoadingScreen(),
        ],
      ),
    );
  }
}
