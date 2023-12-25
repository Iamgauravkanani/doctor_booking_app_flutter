import 'package:demo_task/config/assets.dart';
import 'package:demo_task/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  //Declaration
  int selectedIndex = 0;

  List<Map<String, dynamic>> onboardingList = [
    {
      "title": "Start your journey with\nfun learning videos",
      "subtitle": "explore various learning\nvideos based on your passion",
      "image": Assets.onboarding1
    },
    {
      "title": "Learn your passion,\nlevel up your skill",
      "subtitle": "Make yourself expert your skill\nby studying from mentors",
      "image": Assets.onboarding2
    },
    {
      "title": "Get your graduate with\nextraordinary skills",
      "subtitle": "Got your certificate after finished\nyour online class",
      "image": Assets.onboarding3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 100,
          ),
          //App Intro slider
          Expanded(
            child: PageView.builder(
              itemCount: onboardingList.length,
              onPageChanged: (int page) {
                setState(() {
                  selectedIndex = page;
                });
              },
              itemBuilder: (_, index) {
                var data = onboardingList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 62),
                        child: Image.asset(
                          data['image'],
                          height: MediaQuery.of(context).size.height * .4,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 68,
                    ),
                    Text(
                      data['title'],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: const Color(0xff0D0F44),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      data['subtitle'],
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xff727587),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            alignment: Alignment.topCenter,
            height: (onboardingList.length - 1) == selectedIndex ? 165 : 50,
            child: Column(
              children: [
                // Page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                const SizedBox(
                  height: 40,
                ),
                //Continue Button
                if ((onboardingList.length - 1) == selectedIndex) ...[
                  FilledButton(
                    onPressed: onContinue,
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 79, vertical: 21),
                      ),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xffE77711),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Custom UI
  Widget _indicator(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0XFFE77711) : const Color(0XFFDADEEB),
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < onboardingList.length; i++) {
      list.add(i == selectedIndex ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  // Custom Actions
  void onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginScreen(),
      ),
    );
  }
}
