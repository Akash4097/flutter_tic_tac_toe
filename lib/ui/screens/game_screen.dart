import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/room_data_provider.dart';
import 'package:tictactoe/resources/socket_methods.dart';
import 'package:tictactoe/ui/widgets/scoreboard.dart';
import 'package:tictactoe/ui/widgets/tictactoe_board.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    final roomDataProvider = Provider.of<RoomDataProvider>(context);

    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : const SafeArea(
              child: Column(
                children: [
                  Scoreboard(),
                  TicTacToeBoard(),
                ],
              ),
            ),
    );
  }
}
