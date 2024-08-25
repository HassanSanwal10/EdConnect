import 'package:edconnect/screens/splashscreens/on_boarding_page.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: LottieBuilder.asset(
        "assets/lottie/opener.json",
      ),
      nextScreen: const OnBoardingPage(),
      splashIconSize: 500,
      splashTransition: SplashTransition.fadeTransition,
      // backgroundColor: Colors.greenAccent.shade100,
      duration: 2900,
      curve: Easing.standard,
    );
  }
}
