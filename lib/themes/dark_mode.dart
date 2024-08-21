import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF081C15), // Very dark green background
    primary:
        Color(0xFF40916C), // Dark green for primary elements (e.g., buttons)
    secondary: Color(0xFF2D6A4F), // Deep green for secondary elements
    tertiary:
        Color(0xFF40916C), // Rich green for tertiary elements (e.g., accents)
    inversePrimary:
        Color(0xFF95D5B2), // Soft green for inverse primary elements
  ),
  textTheme: const TextTheme(
    bodyLarge:
        TextStyle(color: Color(0xFFD8F3DC)), // Light green text for readability
    bodyMedium: TextStyle(color: Color(0xFFD8F3DC)),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1B4332), // Dark green for app bar
    foregroundColor: Color(0xFFD8F3DC), // Light green text/icons on the app bar
  ),
);
