import 'package:flutter/material.dart';
import '../../utils/color.dart';
import '../text/text_component.dart';

class LinkComponent extends StatelessWidget {
  final String title;
  final Function()? onTap;
  const LinkComponent(this.title, {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: InkWell(
        onTap: onTap,
        child: TextComponent(
          title,
          size: 16,
          color: linkColor,
        ),
      ),
    );
  }
}
