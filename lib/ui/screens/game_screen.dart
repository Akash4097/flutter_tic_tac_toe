import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/room_data_provider.dart';
import '../../resources/socket_methods.dart';
import '../widgets/scoreboard.dart';
import '../widgets/tictactoe_board.dart';
import '../widgets/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const GameScreen(),
      );

  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersDataListener(context);
    _socketMethods.pointsIncreaseListener(context);
    _socketMethods.endGameListener(context);
  }

  @override
  Widget build(BuildContext context) {
    final roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
                children: [
                  const Scoreboard(),
                  const TicTacToeBoard(),
                  Text(
                      '${roomDataProvider.roomData['turn']['nickName']}\'s turn')
                ],
              ),
            ),
    );
  }
}
