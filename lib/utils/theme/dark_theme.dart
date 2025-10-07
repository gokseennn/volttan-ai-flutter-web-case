import 'package:flutter/material.dart';

class DarkTheme {
  DarkTheme._();
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    colorScheme: _colorScheme,
    fontFamily: 'Montserrat',
    elevatedButtonTheme: _elevatedButtonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    textTheme: _textTheme,
    floatingActionButtonTheme: _floatingActionButtonThemeData,
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
  );

  static final ColorScheme _colorScheme = const ColorScheme.dark(
    primary: Color(0xFF191121),
    secondary: Color(0xFF231234),
    tertiary: Color(0xFF7F19E6),
    surface: Colors.white,
    primaryContainer: Color(0xFF27272A),
  );

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.all(16),
          backgroundColor: _colorScheme.primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );

  static final InputDecorationTheme _inputDecorationTheme =
      InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _colorScheme.primary, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _colorScheme.secondary, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _colorScheme.primary, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: _colorScheme.error, width: 1),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        errorStyle: TextStyle(
          color: _colorScheme.error,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        hintStyle: TextStyle(
          color: _colorScheme.secondary,
          fontSize: 16,
          fontVariations: const [FontVariation('wght', 400)],
        ),
        labelStyle: TextStyle(
          color: _colorScheme.secondary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: TextStyle(
          color: _colorScheme.secondary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  static final TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.secondary,
    ),
    displayMedium: TextStyle(
      fontSize: 24,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.secondary,
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.secondary,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.secondary,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontVariations: const [FontVariation('wght', 600)],
      color: _colorScheme.secondary,
    ),
    headlineSmall: TextStyle(
      fontSize: 14,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.secondary,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: _colorScheme.secondary,
      fontVariations: const [FontVariation('wght', 600)],
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: _colorScheme.secondary,
      fontVariations: const [FontVariation('wght', 600)],
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      color: _colorScheme.secondary,
      fontVariations: const [FontVariation('wght', 600)],
    ),
    bodySmall: TextStyle(fontSize: 12, color: _colorScheme.secondary),
  );

  static final FloatingActionButtonThemeData _floatingActionButtonThemeData =
      FloatingActionButtonThemeData(
        backgroundColor: _colorScheme.primary,
        foregroundColor: _colorScheme.secondary,
        iconSize: 32,
        shape: CircleBorder(
          side: BorderSide(color: _colorScheme.tertiary, width: 1),
        ),
        elevation: 0,
      );
}
