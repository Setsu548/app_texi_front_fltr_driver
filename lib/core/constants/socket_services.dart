import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketServices {
  IO.Socket? _socket;
  String _url;
  String _token;

  SocketServices(this._url, this._token);

  void connect() {
    _socket = IO.io(
      _url,
      IO.OptionBuilder().setTransports(['websocket']).setAuth({
        'token': _token,
      }).build(),
    );
    _socket!.connect();
  }

  void disconnect() {
    _socket?.disconnect();
    _socket?.dispose();
    _socket = null;
  }

  void on(String event, Function(dynamic) callback) {
    _socket?.on(event, callback);
  }

  void off(String event) {
    _socket?.off(event);
  }

  void emit(String event, dynamic data) {
    _socket?.emit(event, data);
  }

  IO.Socket? get socket => _socket;
}
