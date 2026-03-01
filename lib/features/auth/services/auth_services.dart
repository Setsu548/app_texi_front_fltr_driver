import 'package:get_it/get_it.dart';
import 'package:texi/core/constants/storage_keys.dart';
import 'package:texi/core/utils/auth_secure_storeage_service.dart';
import 'package:texi/features/register_driver/data/models/driver_data_res_model.dart';

class AuthServices {
  Future<bool> validateDriverPhone(String phone) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final rawToken = await storage.getString(StorageKeys.driverRegister);
    if (rawToken == null) {
      return false;
    }
    final driverDataResModel = DriverDataModel.fromRawJson(rawToken);
    return driverDataResModel.phoneNumber == phone;
  }
}
