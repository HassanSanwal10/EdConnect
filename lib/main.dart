import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/screens/splashscreens/on_boarding_page.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
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
