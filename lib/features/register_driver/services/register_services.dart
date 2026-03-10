import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:texi/core/constants/storage_keys.dart';
import 'package:texi/core/lang/extension_lang.dart';
import 'package:texi/core/utils/auth_secure_storeage_service.dart';
import 'package:texi/features/register_driver/data/models/driver_model.dart';
import 'package:texi/features/register_driver/domain/entities/driver_entity.dart';
import 'package:texi/features/register_driver/presentation/providers/driver_form_provider.dart';
import 'package:texi/features/register_driver/presentation/providers/driver_identity_provider.dart';

class RegisterServices {
  static Future<bool> registerLocalDriver(DriverEntity driver) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    try {
      await storage.saveToken(
        StorageKeys.driverLocalRegister,
        DriverModel.fromEntity(driver).toRawJson(),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> registerDriverInformation(WidgetRef ref) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final rawDriverInformation = await storage.getString(
      StorageKeys.driverLocalRegister,
    );
    if (rawDriverInformation != null) {
      final notifier = ref.read(driverRegisterProccessProvider.notifier);
      notifier.setLoading();
      try {
        final driverInformation = DriverModel.fromRawJson(
          rawDriverInformation,
        ).toEntity();
        if (await notifier.registerDriver(driverInformation)) {
          if (await notifier.registerDriverIdentification()) {
            if (await notifier.registerDriverLicense()) {
              if (await notifier.updateDriverRegistration()) {
                clearImageProviders(ref);
                notifier.setSuccess();
                await storage.deleteString(StorageKeys.driverLocalRegister);
              } else {
                throw (errorUpdatingDriverRegistration.i18n);
              }
            } else {
              throw (errorRegisteringDriverId.i18n);
            }
          } else {
            throw (errorRegisteringDriverId.i18n);
          }
        } else {
          throw (errorRegisteringDriverInfo.i18n);
        }
      } catch (e) {
        notifier.setError(e);
        rethrow;
      }
    } else {
      throw (driverInfoExeption.i18n);
    }
  }

  static void clearImageProviders(WidgetRef ref) {
    ref.invalidate(backIdentificationProvider);
    ref.invalidate(profileImageProvider);
    ref.invalidate(frontIdentificationProvider);
    ref.invalidate(backLicenseProvider);
    ref.invalidate(frontLicenseProvider);
  }
}
