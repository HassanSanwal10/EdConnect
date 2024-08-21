import 'package:flutter/material.dart';

class ThemeSettings {
  static bool isDarkModeOn = false;

  static void updateThemeBasedOnSystemBrightness(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    isDarkModeOn = brightness == Brightness.dark;
  }
}
