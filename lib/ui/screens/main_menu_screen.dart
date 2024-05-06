import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/utils/responsive.dart';

import '../widgets/custom_elevated_button.dart';
import 'create_room_screen.dart';
import 'join_room_screen.dart';

class MainMenuScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const MainMenuScreen(),
      );

  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ResponsiveWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CsustomElevatedButton(
                onTap: () => Navigator.push(
                  context,
                  CreateRoomScreen.route(),
                ),
                text: "Create Room",
              ),
              const Gap(16),
              CsustomElevatedButton(
                onTap: () => Navigator.push(
                  context,
                  JoinRoomScreen.route(),
                ),
                text: "Join Room",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
