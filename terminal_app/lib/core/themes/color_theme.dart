
import 'package:flutter/material.dart';

class ColorTheme {
  static ThemeData lightThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    colorScheme: _lightThemeColorScheme
  );

  static ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    backgroundColor: Colors.black,
    colorScheme: _darkThemeColorScheme
  );

  static const ColorScheme _lightThemeColorScheme = ColorScheme(
    primary: Color(0xFFFF7043), 
    primaryVariant: Color(0xFFFC7D57), 
    secondary: Color(0xFFFF9170), 
    secondaryVariant: Color(0xFFFD9C7E), 
    surface: Colors.white, 
    background: Colors.white, 
    error: Color(0xFFFF1744), 
    onPrimary: Colors.white, 
    onSecondary: Colors.black, 
    onSurface: Colors.black, 
    onBackground: Colors.black, 
    onError: Colors.white, 
    brightness: Brightness.light
  );

  static const ColorScheme _darkThemeColorScheme = ColorScheme(
    primary: Color(0xFFFF7043), 
    primaryVariant: Color(0xFFFC7D57), 
    secondary: Color(0xFFFF9170), 
    secondaryVariant: Color(0xFFFD9C7E), 
    surface: Color(0xFF1D1D1D), 
    background: Colors.black, 
    error: Color(0xFFFF1744), 
    onPrimary: Colors.white, 
    onSecondary: Colors.black, 
    onSurface: Colors.white, 
    onBackground: Colors.white, 
    onError: Colors.white, 
    brightness: Brightness.light
  );

  static const Color primary = Color(0xFFFF7043);
  static const Color borderColor = Colors.black12;
}