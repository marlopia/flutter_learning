import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({super.key, required this.onTabChange});

  void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey[600],
        tabActiveBorder: Border.all(color: Colors.grey.shade100),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 15,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.home,
            text: "Shop",
            ),
          GButton(
            icon: Icons.shopping_cart,
            text: "Cart",
            ),
          GButton(
            icon: Icons.logout,
            text: "Logout",
            ),
        ],
        ),
    );
  }
}