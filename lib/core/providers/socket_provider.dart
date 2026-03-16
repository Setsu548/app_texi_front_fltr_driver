import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:texi_driver/core/constants/storage_keys.dart';
import 'package:texi_driver/core/utils/auth_secure_storeage_service.dart';
import 'package:texi_driver/core/utils/socket_service.dart';

/// Proveedor asíncrono que inicializa y expone el SocketService de forma global.
/// Usamos FutureProvider porque necesitamos leer el token de forma asíncrona.
final socketServiceProvider = FutureProvider<SocketService?>((ref) async {
  final storage = GetIt.instance<AuthSecureStorageService>();
  final tokenTemp = await storage.getString(StorageKeys.driverToken);

  if (tokenTemp != null && tokenTemp.isNotEmpty) {
    final url = dotenv.env['WEB_SOCKET'];
    if (url == null) {
      throw Exception("WEB_SOCKET no está definido en el archivo .env");
    }

    final socketService = SocketService(url, tokenTemp);

    ref.onDispose(() {
      socketService.disconnect();
    });

    return socketService;
  }

  return null;
});
