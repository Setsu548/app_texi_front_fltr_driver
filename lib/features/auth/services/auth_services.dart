import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/providers/socket_provider.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/features/auth/data/models/connection_ack_res_model.dart';
import 'package:texi_driver/features/auth/data/models/login_data_model.dart';
import 'package:texi_driver/features/auth/presentation/providers/auth_providers.dart';

class AuthServices {
  static void initSocket(WidgetRef ref) async {
    await ref.read(socketServiceProvider.future);
    connectionAckSocket(ref);
  }

  static void connectionAckSocket(WidgetRef ref) {
    final socket = ref.read(socketServiceProvider).value;
    final profileNotifier = ref.read(profileNotifierProvider.notifier);
    socket?.onMessage("connection:ack", (data) {
      final connectionAckResModel = ConnectionAckResModel.fromJson(data);
      profileNotifier.loadFromConnectionAck(connectionAckResModel);
    });
  }

  static Future<bool> isDriverTokenExpired() async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final token = await storage.getString(StorageKeys.driverToken);
    if (token == null) {
      throw Exception(userNotFound.i18n);
    }
    return Jwt.isExpired(token);
  }

  static Future<void> saveDriverTokens(LoginDataModel cookie) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    await storage.saveToken(StorageKeys.driverToken, cookie.token);
    await storage.saveToken(
      StorageKeys.driverRefreshToken,
      cookie.refreshToken,
    );
  }

  static Future<void> refreshToken(WidgetRef ref) async {
    final repo = ref.read(authRepoProvider);
    final url = dotenv.env['BASE_URL'];
    final storage = GetIt.instance<AuthSecureStorageService>();
    final token = await storage.getString(StorageKeys.driverToken);
    final refreshToken = await storage.getString(
      StorageKeys.driverRefreshToken,
    );
    if (token == null || refreshToken == null) {
      throw Exception(userNotFound.i18n);
    }
    final dioRefresh = Dio(
      BaseOptions(
        baseUrl: url!,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $refreshToken',
        },
      ),
    );
    final response = await repo.refreshToken(dioRefresh);
    if (response.success) {
      await saveDriverTokens(response.data!);
    } else {
      throw Exception(response.message);
    }
  }

  static Future<void> logout(WidgetRef ref) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final repo = ref.read(authRepoProvider);
    final response = await repo.logout();
    if (response.success) {
      await storage.deleteString(StorageKeys.driverToken);
      await storage.deleteString(StorageKeys.driverRefreshToken);
    } else {
      throw Exception(response.message);
    }
  }
}
