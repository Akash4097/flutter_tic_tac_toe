import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIOClient {
  io.Socket? socket;
  static SocketIOClient? _instance;

  SocketIOClient._internal() {
    socket = io.io('http://192.168.29.232:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
  }

  static SocketIOClient get instance {
    _instance ??= SocketIOClient._internal();
    return _instance!;
  }
}
