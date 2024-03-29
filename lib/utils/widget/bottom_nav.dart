import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app_sg/pages/home.dart';
import 'package:food_delivery_app_sg/pages/order.dart';
import 'package:food_delivery_app_sg/pages/profile.dart';
import 'package:food_delivery_app_sg/pages/wallet.dart';
import 'package:food_delivery_app_sg/utils/constants.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> pages = [
    const Home(),
    const Order(),
    const Profile(),
    const Wallet(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        backgroundColor: Colors.white,
        color: Colors.black,
        buttonBackgroundColor: Colors.black,
        animationCurve: Curves.bounceIn,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        animationDuration: const Duration(
          milliseconds: 100,
        ),
        items: const [
          Icon(
            Icons.home_outlined,
          ),
          Icon(
            Icons.shopping_bag_outlined,
          ),
          Icon(
            Icons.wallet_outlined,
          ),
          Icon(
            Icons.person_outlined,
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
