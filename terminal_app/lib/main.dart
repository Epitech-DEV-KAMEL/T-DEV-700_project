import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/app.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/injection_container.dart';

void main() {
  init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const TerminalApp(),
    )
  );
}