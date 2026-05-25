import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: GNav(
        color: Colors.grey[500],
        activeColor: const Color.fromARGB(255, 31, 31, 32),
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade300,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 15,

        onTabChange: (value) => onTabChange!(value),
        
        tabs: const [
          GButton(
            icon: Icons.home,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Cart',
          )
        ]
      ),
    );
  }
}