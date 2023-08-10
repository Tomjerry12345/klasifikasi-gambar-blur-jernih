import 'package:flutter/material.dart';

class ButtonElevatedComponent extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color bg;
  final Color fg;
  final double? w;
  final double? h;
  final Color? cb;
  const ButtonElevatedComponent(this.title,
      {super.key,
      required this.onPressed,
      this.bg = Colors.black,
      this.fg = Colors.white,
      this.w,
      this.h,
      this.cb});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bg,
          foregroundColor: fg,
          padding: const EdgeInsets.all(16),
          minimumSize: const Size(120, 40),
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              side: BorderSide(color: cb ?? bg, width: 1)),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
