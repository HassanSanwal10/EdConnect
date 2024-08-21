import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFD8F3DC), // Light green background
    primary:
        Color(0xFF52B788), // Medium green for primary elements (e.g., buttons)
    secondary: Color(0xFF74C69D), // Muted green for secondary elements
    tertiary:
        Color(0xFF95D5B2), // Soft green for tertiary elements (e.g., accents)
    inversePrimary:
        Color(0xFF40916C), // Rich green for inverse primary elements
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black), // Black text for readability
    bodyMedium: TextStyle(color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF74C69D), // Medium green for app bar
    foregroundColor: Color(0xFF1B4332),
  ),
);
