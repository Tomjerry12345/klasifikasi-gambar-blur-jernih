import 'package:flutter/material.dart';

import '../text/text_component.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData icLeft;
  final IconData icRight;
  final Function()? leftOnPressed;
  final Function()? rightOnPressed;
  final List<Widget>? tab;
  final Color? bg;
  final Color fg;
  final double sizeTitle;

  const AppBarComponent(
      {super.key,
      this.title = "",
      this.icLeft = Icons.sort,
      this.icRight = Icons.logout,
      this.leftOnPressed,
      this.rightOnPressed,
      this.tab,
      this.bg,
      this.fg = Colors.black,
      this.sizeTitle = 24});

  Widget titleC() {
    return TextComponent(
      title,
      color: fg,
      size: sizeTitle,
    );
  }

  Widget leftIcon() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: IconButton(
        icon: Icon(
          icLeft,
          size: 32,
          color: fg,
        ),
        onPressed: leftOnPressed,
      ),
    );
  }

  Widget rightIcon() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: IconButton(
        icon: Icon(
          icRight,
          size: 32,
          color: fg,
        ),
        onPressed: rightOnPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleC(),
      centerTitle: true,
      toolbarHeight: 150,
      backgroundColor: bg,
      // leading: leftIcon(),
      actions: [rightIcon()],
      bottom: (tab != null && tab!.isNotEmpty)
          ? TabBar(
              tabs: tab ?? [],
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(150);
}
