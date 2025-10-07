import 'package:flutter/material.dart';

class DarkTheme {
  DarkTheme._();
  static final ThemeData themeData = ThemeData(
    brightness: Brightness.dark,
    colorScheme: _colorScheme,
    fontFamily: 'Montserrat',
    elevatedButtonTheme: _elevatedButtonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    textTheme: _textTheme,
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
        style: ButtonStyle(
          elevation: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return 4.0;
            }
            if (states.contains(WidgetState.pressed)) {
              return 2.0;
            }
            return 0.0;
          }),
          padding: const WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          ),
          minimumSize: const WidgetStatePropertyAll(Size(48, 48)),
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return _colorScheme.tertiary.withValues(alpha: 0.4);
            }
            if (states.contains(WidgetState.pressed)) {
              return _colorScheme.tertiary.withValues(alpha: 0.9);
            }
            return _colorScheme.tertiary;
          }),
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          overlayColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return _colorScheme.tertiary.withValues(alpha: 0.08);
            }
            if (states.contains(WidgetState.pressed)) {
              return _colorScheme.tertiary.withValues(alpha: 0.16);
            }
            return _colorScheme.tertiary.withValues(alpha: 0.12);
          }),
          textStyle: WidgetStatePropertyAll(
            TextStyle(
              fontSize: 16,
              fontVariations: const [FontVariation('wght', 700)],
            ),
          ),
          shadowColor: WidgetStatePropertyAll(
            Colors.black.withValues(alpha: 0.25),
          ),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: _colorScheme.tertiary, width: 1),
            ),
          ),
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
          borderSide: BorderSide(color: _colorScheme.surface, width: 1),
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
          color: _colorScheme.surface,
          fontSize: 16,
          fontVariations: const [FontVariation('wght', 400)],
        ),
        labelStyle: TextStyle(
          color: _colorScheme.surface,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        floatingLabelStyle: TextStyle(
          color: _colorScheme.surface,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );

  static final TextTheme _textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 64,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.surface,
    ),
    displayMedium: TextStyle(
      fontSize: 48,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.surface,
    ),
    displaySmall: TextStyle(
      fontSize: 32,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.surface,
    ),
    headlineLarge: TextStyle(
      fontSize: 48,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.surface,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      fontVariations: const [FontVariation('wght', 600)],
      color: _colorScheme.surface,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontVariations: const [FontVariation('wght', 700)],
      color: _colorScheme.surface,
    ),
    bodyLarge: TextStyle(
      fontSize: 24,
      color: _colorScheme.surface,
      fontVariations: const [FontVariation('wght', 600)],
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      color: _colorScheme.surface,
      fontVariations: const [FontVariation('wght', 600)],
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      color: _colorScheme.surface,
      fontVariations: const [FontVariation('wght', 600)],
    ),
    bodySmall: TextStyle(fontSize: 16, color: _colorScheme.surface),
  );
  IconThemeData get iconThemeData => IconThemeData(
    color: _colorScheme.surface,
    size: 24,
  );
}
