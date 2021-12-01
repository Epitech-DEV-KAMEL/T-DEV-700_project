
import 'package:flutter/material.dart';
import 'package:terminal_app/features/presentation/pages/cart_page.dart';

class TerminalApp extends StatefulWidget {
  const TerminalApp({ Key? key }) : super(key: key);

  @override
  _TerminalAppState createState() => _TerminalAppState();
}

class _TerminalAppState extends State<TerminalApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Terminal",
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFFFFFFF)),
      home: const CartPage(),
    );
  }
}