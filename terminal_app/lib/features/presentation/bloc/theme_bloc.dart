
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_app/core/themes/color_theme.dart';

enum AppTheme { light, dark }

class ThemeState {
  final AppTheme appTheme;
  final ThemeData themeData;

  ThemeState({ required this.appTheme, required this.themeData});
}

class ThemeBloc extends Cubit<ThemeState> {
  ThemeBloc() : super(_lightTheme());

  void toogleState() {
    if (state.appTheme == AppTheme.light) {
      emit(_darkTheme());
    } else {
      emit(_lightTheme());
    }
  }

  static ThemeState _lightTheme() {
    return ThemeState(
      appTheme: AppTheme.light,
      themeData: ColorTheme.lightThemeData
    );
  }

  static ThemeState _darkTheme() {
    return ThemeState(
      appTheme: AppTheme.dark,
      themeData: ColorTheme.darkThemeData
    );
  }
}