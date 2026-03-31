import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/lang/extension_lang.dart';
import 'package:texi_driver/core/providers/socket_provider.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/features/auth/data/models/connection_ack_res_model.dart';
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

  static Future<bool> isDriverTokenExpired(WidgetRef ref) async {
    final storage = GetIt.instance<AuthSecureStorageService>();
    final token = await storage.getString(StorageKeys.driverToken);
    if (token == null) {
      throw Exception(tokenNotFound.i18n);
    }
    return Jwt.isExpired(token);
  }
}
