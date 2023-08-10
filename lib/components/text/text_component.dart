import 'package:flutter/material.dart';

class TextComponent extends StatelessWidget {
  final String text;
  final FontWeight weight;
  final double size;
  final Color color;
  const TextComponent(this.text,
      {super.key, this.weight = FontWeight.w900, this.size = 24, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontFamily: "Lato", fontWeight: weight, fontSize: size, color: color),
    );
  }
}
