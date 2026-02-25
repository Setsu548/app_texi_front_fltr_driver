import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:texi/features/register_driver/data/models/driver_data_res_model.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  final _secureStorage = FlutterSecureStorage();

  static const _keyDriverData = 'texi_driver';

  Future<void> saveDriver(DriverDataModel driver) async {
    final String value = driver.toRawJson();
    await _secureStorage.write(key: _keyDriverData, value: value);
  }

  Future<DriverDataModel?> getDriver() async {
    try {
      final String? value = await _secureStorage.read(key: _keyDriverData);

      if (value == null) return null;

      return DriverDataModel.fromRawJson(value);
    } catch (e) {
      return null;
    }
  }

  Future<void> clearDriver() async {
    await _secureStorage.delete(key: _keyDriverData);
  }

  Future<bool> hasDriverData() async {
    return await _secureStorage.containsKey(key: _keyDriverData);
  }
}
