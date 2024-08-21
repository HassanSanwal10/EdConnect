import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/pages/splashscreens/on_boarding_page.dart';
import 'package:edconnect/themes/dark_mode.dart';
import 'package:edconnect/themes/light_mode.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeSettings.updateThemeBasedOnSystemBrightness(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeSettings.isDarkModeOn ? darkMode : lightMode,
      home: const OnBoardingPage(),
    );
  }
}
