
import 'package:flutter/material.dart';

import 'color_theme.dart';

class CommonStyle {
  static InputDecoration textFieldStyle({String label = "", String placeholder = "", Icon? icon}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(12.0),
      labelText: label,
      hintText: placeholder,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorTheme.primary as Color
        ),
      ),
      fillColor: ColorTheme.primary,
      errorStyle: const TextStyle(height: 0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0)
      )
    );
  }

  static ButtonStyle elevatedButton() {
    return ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(14.0),
      primary: ColorTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)
      )
    );
  }
}