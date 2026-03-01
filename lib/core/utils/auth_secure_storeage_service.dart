import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthSecureStorageService {
  static final AuthSecureStorageService _instance =
      AuthSecureStorageService._internal();
  factory AuthSecureStorageService() => _instance;

  AuthSecureStorageService._internal();

  final _secureStorage = const FlutterSecureStorage();

  Future<void> saveToken(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getString(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> deleteString(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<bool> hasData(String key) async {
    return await _secureStorage.containsKey(key: key);
  }

  Future<void> clearAll() async {
    await _secureStorage.deleteAll();
  }
}
