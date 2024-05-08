import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/providers/room_data_provider.dart';
import 'package:tictactoe/utils/app_colors.dart';

class GameScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const GameScreen(),
      );

  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.bgColor,
        elevation: 0.0,
      ),
      body: Center(
        child: Text(
          Provider.of<RoomDataProvider>(context).roomData.toString(),
        ),
      ),
    );
  }
}
