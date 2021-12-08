
import 'package:flutter/material.dart';
import 'package:terminal_app/core/themes/common_style.dart';

class CoreElevatedButton extends ElevatedButton {
  CoreElevatedButton({Key? key, required String text, required VoidCallback? onPressed}) : super(
    key: key,
    onPressed: onPressed,
    style: CommonStyle.elevatedButton(),
    child: Text(
      text,
      style: CommonStyle.elevatedButtonText
    )
  );
}