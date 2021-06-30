import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      textTheme: _textTheme,
      textButtonTheme: _textButtonThemeData);

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

  static TextTheme _textTheme = GoogleFonts.firaSansTextTheme();

  static TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return _darkColorScheme.primary.withAlpha(120);
        } else {
          return _darkColorScheme.primary;
        }
      }),
    ),
  );
}
