import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/app.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const TerminalApp(),
    )
  );
}