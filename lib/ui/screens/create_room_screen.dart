import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../resources/socket_methods.dart';
import '../../utils/responsive.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/glow_text.dart';

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
  final _socketMethod = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethod.createRoomSuccess(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
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
              const GlowText(text: "Create Room", fontSize: 72),
              Gap(size.height * .08),
              CustomTextField(
                controller: _nameController,
                hintText: "Enter nick name...",
              ),
              Gap(size.height * .04),
              CustomElevatedButton(
                onTap: () {
                  _socketMethod.createRoom(_nameController.text.trim());
                },
                text: "Create Room",
              )
            ],
          ),
        ),
      ),
    );
  }
}
