import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/pages/home_page.dart';
import 'package:edconnect/themes/dark_mode.dart';
import 'package:edconnect/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: const HomePage(),
    );
  }
}
