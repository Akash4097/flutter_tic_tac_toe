import 'package:flutter/material.dart';
import 'package:tictactoe/utils/app_colors.dart';

import 'ui/screens/main_menu_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColor.bgColor,
      ),
      home: const MainMenuScreen(),
    );
  }
}
