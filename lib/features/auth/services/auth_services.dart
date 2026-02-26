import 'package:texi/features/register_driver/services/register_secure_storage_service.dart';
import 'package:texi/features/register_driver/data/models/driver_data_res_model.dart';

class AuthServices {
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
