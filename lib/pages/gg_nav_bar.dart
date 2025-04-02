import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class GoogleNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  GoogleNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GNav(
        padding: EdgeInsets.all(12),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabBorderRadius: 18,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(
            icon: Icons.storefront_outlined,
            text: 'Shop',
            iconColor: Colors.white,
            backgroundColor: Colors.deepOrangeAccent,
            iconActiveColor: Colors.white,
            textColor: Colors.white,
          ),
          GButton(
            icon: Icons.shopping_cart_outlined,
            text: 'Cart',
            iconColor: Colors.white,
            backgroundColor: Colors.deepOrangeAccent,
            iconActiveColor: Colors.white,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
