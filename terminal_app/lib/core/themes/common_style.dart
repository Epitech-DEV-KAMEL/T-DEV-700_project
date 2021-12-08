
import 'dart:math';

import 'package:flutter/material.dart';

import 'color_theme.dart';

class CommonStyle {
  static InputDecoration inputDecoration(BuildContext context, {String label = "", String placeholder = ""}) {
    return InputDecoration(
      labelText: label,
      hintText: placeholder,
      hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface.withAlpha(180)),
      labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground.withAlpha(30)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.onBackground.withAlpha(30)),
      ),
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

  static const TextStyle elevatedButtonText = TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );

  static const LinearGradient cardLinearGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      Colors.black,
      Colors.black87,
      Colors.black,
    ],
    stops: <double>[
      0.25,
      0.4,
      0,
    ]
  );

  static BoxDecoration articleCardBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(color: ColorTheme.borderColor),
      borderRadius: BorderRadius.circular(6.0),
    );
  }

  static BoxDecoration thumnailBoxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(6.0),
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)][100]
    );
  }

  static TextStyle articleCardTitleTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface
    );
  }

  static TextStyle articleCardDescriptionTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 12.0,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(200)
    );
  }

  static TextStyle articleCardPriceTextStyle(BuildContext context) {
    return TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface
    );
  }

  static TextStyle paymentOutlineButtonSubTextStyle(BuildContext context) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface.withAlpha(225)
    );
  }
}