import 'package:flutter/material.dart';

class AppTheme {

  static ThemeData baseTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: _darkColorScheme,
    primaryColor: _darkColorScheme.primary,
    secondaryHeaderColor: _darkColorScheme.secondary,
    appBarTheme: AppBarTheme(
      foregroundColor: _darkColorScheme.onSurface,
      backgroundColor: _darkColorScheme.surface,
      brightness: Brightness.dark,
    ),
    backgroundColor: _darkColorScheme.background,
    accentColor: _darkColorScheme.secondary,


  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    primary: Color(0xFF81C784),
    primaryVariant: Color(0xFF416442),
    secondary: Color(0xFFFF9E80),
    secondaryVariant: Color(0xFF804F40),
    surface: Color(0xFF262626),
    background: Color(0xFF030303),
    error: Color(0xFFD53A73),
    onPrimary: Color(0xFF030303),
    onSecondary: Color(0xFF030303),
    onSurface: Color(0xFFFAFAFA),
    onBackground: Color(0xFFAAAAAA),
    onError: Color(0xFFFAFAFA),
    brightness: Brightness.dark,
  );

}