import 'package:demo_task/config/assets.dart';
import 'package:demo_task/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  //Declaration
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomeScreen(),
      // Bottom Navigation
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white.withOpacity(.96),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        onTap: onTapNav,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: navIcon(Assets.ic_home, 0),
            title: const Text("Home"),
            selectedColor: const Color(0xffE77711).withOpacity(.40),
          ),

          /// Message
          SalomonBottomBarItem(
            icon: navIcon(Assets.ic_message, 1),
            title: const Text("Message"),
            selectedColor: const Color(0xffE77711).withOpacity(.40),
          ),

          /// Notification
          SalomonBottomBarItem(
            icon: navIcon(Assets.ic_bell, 2),
            title: const Text("Notification"),
            selectedColor: const Color(0xffE77711).withOpacity(.40),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: navIcon(Assets.ic_profile, 3),
            title: const Text("Profile"),
            selectedColor: const Color(0xffE77711).withOpacity(.40),
          ),
        ],
      ),
    );
  }

  //Custom UI
  Widget navIcon(image, index) {
    return Image.asset(
      image,
      height: 24,
      width: 24,
      color: _currentIndex == index
          ? const Color(0xffE77711)
          : const Color(0xff161C2B),
    );
  }

  //Custom Action
  void onTapNav(int index) => setState(() => _currentIndex = index);
}
