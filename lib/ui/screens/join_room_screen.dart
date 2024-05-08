import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/socket_methods.dart';
import '../../utils/responsive.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/glow_text.dart';

class JoinRoomScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const JoinRoomScreen(),
      );

  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final _nameController = TextEditingController();
  final _gameIdController = TextEditingController();
  final _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayersDataListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _gameIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ResponsiveWidget(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GlowText(text: "Join Room", fontSize: 72),
              Gap(size.height * .08),
              CustomTextField(
                controller: _nameController,
                hintText: "Enter nice name...",
              ),
              Gap(size.height * .04),
              CustomTextField(
                controller: _gameIdController,
                hintText: "Enter game id...",
              ),
              Gap(size.height * .04),
              CustomElevatedButton(
                onTap: () {
                  _socketMethods.joinRoom(
                    _nameController.text.trim(),
                    _gameIdController.text.trim(),
                  );
                },
                text: "Join Room",
              )
            ],
          ),
        ),
      ),
    );
  }
}
