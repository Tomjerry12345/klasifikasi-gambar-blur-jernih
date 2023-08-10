import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../../models/item_menu.dart';
import '../../utils/color.dart';

class BottomBarStaffComponent extends StatelessWidget {
  final PageController pageController;
  final List<ItemMenu> item;
  final Color inActiveColor;
  final Color activeColor;

  const BottomBarStaffComponent(
      {super.key,
      required this.pageController,
      required this.item,
      this.inActiveColor = Colors.white,
      this.activeColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      pageController: pageController,
      color: primaryColor,
      showLabel: false,
      notchColor: Colors.black87,
      bottomBarItems: item
          .map((e) => BottomBarItem(
              inActiveItem: Icon(
                e.icon,
                color: inActiveColor,
              ),
              activeItem: Icon(
                e.icon,
                color: activeColor,
              )))
          .toList(),
      onTap: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
