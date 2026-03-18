import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:texi_driver/core/providers/socket_provider.dart';
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
}
