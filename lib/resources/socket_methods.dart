import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tictactoe/resources/game_methods.dart';
import 'package:tictactoe/utils/show_snackbar.dart';

import '../providers/room_data_provider.dart';
import '../ui/screens/game_screen.dart';
import 'socket_io_client.dart';

class SocketMethods {
  final _socketClient = SocketIOClient.instance.socket;

  Socket get socketClient => _socketClient!;

  ///
  /// All Emitter
  ///

  // This is the event generated by the client and server will listen to it.
  void createRoom(String nickName) {
    if (nickName.isNotEmpty) {
      _socketClient?.emit("createRoom", {
        'nickname': nickName,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient?.emit("joinRoom", {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  void tappedGrid(int index, String roomId, List<String> displayElements) {
    if (displayElements[index] == "") {
      _socketClient?.emit("tap", {
        'index': index,
        'roomId': roomId,
      });
    }
  }

  ///
  /// All Listeners
  ///

  // This is the event generated by the server and here the clinet is listening.
  void createRoomSuccessListener(BuildContext context) {
    _socketClient?.on('createRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.push(context, GameScreen.route());
    });
  }

  void joinRoomSuccessListener(BuildContext context) {
    _socketClient?.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.push(context, GameScreen.route());
    });
  }

  void errorOccurredListener(BuildContext context) {
    _socketClient?.on('errorOccurred', (error) {
      showSnackBar(context, error);
    });
  }

  void updatePlayersDataListener(BuildContext context) {
    _socketClient?.on('updatePlayers', (playersData) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateMainPlayerData(playersData[0]);
      Provider.of<RoomDataProvider>(context, listen: false)
          .updatejoineePlayerData(playersData[1]);
    });
  }

  void updateRoomListener(BuildContext context) {
    _socketClient?.on('updateRoom', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
    });
  }

  void tappedListener(BuildContext context) {
    _socketClient?.on('tapped', (data) {
      final roomProvider =
          Provider.of<RoomDataProvider>(context, listen: false);
      roomProvider.updateDisplayElement(data['index'], data['choice']);
      roomProvider.updateRoomData(data['room']);
      GameMethods().checkWinner(context, _socketClient);
    });
  }
}
