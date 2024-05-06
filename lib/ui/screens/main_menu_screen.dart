import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/utils/responsive.dart';
import '../widgets/custom_elevated_button.dart';

class MainMenuScreen extends StatelessWidget {
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
                onTap: () {},
                text: "Create Room",
              ),
              const Gap(16),
              CsustomElevatedButton(
                onTap: () {},
                text: "Join Room",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
