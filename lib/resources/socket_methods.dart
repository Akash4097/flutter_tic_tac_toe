import 'socket_io_client.dart';

class SocketMethods {
  final _socketClient = SocketIOClient.instance.socket;

  void createRoom(String nickName) {
    if (nickName.isNotEmpty) {
      _socketClient?.emit("createRoom", {
        'nickName': nickName,
      });
    }
  }
}
