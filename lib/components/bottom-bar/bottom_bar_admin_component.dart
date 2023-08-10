import 'package:flutter/material.dart';

class BottomBarAdmin extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemTapped;

  const BottomBarAdmin({super.key, required this.selectedIndex, this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          // height: 180,
          child: BottomNavigationBar(
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              const BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Staff'),
            ],
            currentIndex: selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: onItemTapped,
          ),
        ));
  }
}
