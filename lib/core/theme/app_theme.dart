import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkGreen = Color(0xFF0A3323);
  static const Color mossGreen = Color(0xFF839958);
  static const Color beige = Color(0xFFF7F4D5);
  static const Color midnightGreen = Color(0xFF105666);

  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: beige,
      primaryColor: darkGreen,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkGreen,
        foregroundColor: beige,
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkGreen,
          foregroundColor: beige,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: midnightGreen),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: darkGreen, width: 2),
        ),
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: midnightGreen),
      ),
    );
  }
}