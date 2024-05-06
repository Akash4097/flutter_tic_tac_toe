import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tictactoe/ui/widgets/custom_elevated_button.dart';
import 'package:tictactoe/ui/widgets/custom_text_field.dart';
import 'package:tictactoe/ui/widgets/glow_text.dart';
import 'package:tictactoe/utils/responsive.dart';

class CreateRoomScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateRoomScreen(),
      );
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: ResponsiveWidget(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GlowText(text: "Create Room", fontSize: 72),
              Gap(size.height * .08),
              CustomTextField(
                controller: _nameController,
                hintText: "Enter nice name...",
              ),
              Gap(size.height * .04),
              CustomElevatedButton(
                onTap: () {},
                text: "Create Room",
              )
            ],
          ),
        ),
      ),
    );
  }
}
