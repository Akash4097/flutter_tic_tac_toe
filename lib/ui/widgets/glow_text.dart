import 'package:flutter/material.dart';

class GlowText extends StatelessWidget {
  final List<Shadow>? shadow;
  final String text;
  final double fontSize;
  const GlowText({
    super.key,
    this.shadow,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        shadows: shadow ??
            [
              const Shadow(
                blurRadius: 40,
                color: Colors.blue,
              )
            ],
        fontSize: fontSize,
        height: 1.2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
