import 'package:flutter/material.dart';
import 'package:tictactoe/data_models/player.dart';

class RoomDataProvider extends ChangeNotifier {
  Map<String, dynamic> _roomData = {};
  Player _mainPlayer = Player(
    nickname: "",
    socketID: "",
    charType: "",
    points: 0.0,
  );

  Player _joineePlayer = Player(
    nickname: "",
    socketID: "",
    charType: "",
    points: 0.0,
  );

  Map<String, dynamic> get roomData => _roomData;
  Player get mainPlayer => _mainPlayer;
  Player get joineePlayer => _joineePlayer;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updateMainPlayerData(Map<String, dynamic> playerData) {
    _mainPlayer = Player.fromMap(playerData);
    notifyListeners();
  }

  void updatejoineePlayerData(Map<String, dynamic> playerData) {
    _joineePlayer = Player.fromMap(playerData);
    notifyListeners();
  }
}
