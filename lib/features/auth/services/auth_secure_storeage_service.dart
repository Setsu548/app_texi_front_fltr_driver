import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:texi/features/auth/data/models/login_data_model.dart';

//TODO: Cambiar a clase genérica para que se pueda usar en cualquier parte de la aplicación
class AuthSecureStorageService {
  static final AuthSecureStorageService _instance =
      AuthSecureStorageService._internal();
  factory AuthSecureStorageService() => _instance;

  AuthSecureStorageService._internal();

  final _secureStorage = FlutterSecureStorage();

  static const _keyDriverData = 'texi_driver';

  Future<void> saveDriver(LoginDataModel login) async {
    final String value = login.toRawJson();
    await _secureStorage.write(key: _keyDriverData, value: value);
  }

  Future<LoginDataModel?> getDriver() async {
    try {
      final String? value = await _secureStorage.read(key: _keyDriverData);

      if (value == null) return null;

      return LoginDataModel.fromRawJson(value);
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
