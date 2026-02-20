import 'package:texi/core/utils/secure_storage_service.dart';
import 'package:texi/features/register/data/models/driver_data_res_model.dart';

class ValidateCokieDriver {
  final SecureStorageService _secureStorageService = SecureStorageService();

  Future<DriverDataModel?> validateCokieDriver(String phone) async {
    final DriverDataModel? driverDataModel = await _secureStorageService
        .getDriver();
    if (driverDataModel == null) {
      return null;
    }
    if (driverDataModel.phoneNumber != phone) {
      return null;
    }
    return driverDataModel;
  }
}
