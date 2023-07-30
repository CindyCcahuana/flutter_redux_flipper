import 'package:flutter/material.dart';

class CustomThemeData {
  ThemeData themeData = ThemeData.light();
  ColorScheme colorScheme;
  Iterable<ThemeExtension<dynamic>> extensions;

  CustomThemeData({
    isDark = false,
    required this.colorScheme,
    required this.extensions,
  }) {
    if (!isDark) {
      themeData = ThemeData.light().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        extensions: extensions,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          isDense: true,
          alignLabelWithHint: true,
        ),
      );
    }
    if (isDark) {
      themeData = ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        extensions: extensions,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          isDense: true,
          alignLabelWithHint: true,
        ),
      );
    }
  }

  ThemeData get() {
    return themeData;
  }
}
