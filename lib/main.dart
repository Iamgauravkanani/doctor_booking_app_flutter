import 'package:demo_task/screen/home/home_screen.dart';
import 'package:demo_task/screen/login/login_screen.dart';
import 'package:demo_task/screen/navigation/navigation_screen.dart';
import 'package:demo_task/screen/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (ctx) => const OnboardingScreen(),
        'login': (ctx) => const LoginScreen(),
        'navigation': (ctx) => const NavigationScreen(),
      },
    ),
  );
}
