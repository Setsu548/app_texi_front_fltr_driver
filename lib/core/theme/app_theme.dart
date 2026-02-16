import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryColor = Color(0xFFFFD600);
  static const Color _onPrimaryColor = Color(0xFF000000);
  static const Color _backgroundColor = Color(0xFF1a1a1a);
  static const Color _onBackgroundColor = Color(0xFFFFFFFF);

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _backgroundColor,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: _onBackgroundColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: _onPrimaryColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: _primaryColor),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: _primaryColor,
      scaffoldBackgroundColor: _backgroundColor,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: _onBackgroundColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: _onPrimaryColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: _primaryColor),
      ),
    );
  }
}
