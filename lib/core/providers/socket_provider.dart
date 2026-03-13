import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:texi/core/constants/socket_services.dart';

class SocketProvider {
  SocketServices? socketServices;

  void initConnection(String token) {
    socketServices = SocketServices(dotenv.env['WEB_SOCKET']!, token);
    socketServices!.connect();
    _listenToEvents();
  }

  void _listenToEvents() {
    socketServices!.on('connection:ack', (data) {
      print(data);
    });
  }
}
