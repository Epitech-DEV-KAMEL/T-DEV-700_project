import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_app/features/presentation/bloc/theme_bloc.dart';
import 'package:terminal_app/features/presentation/pages/cart_page.dart';

class TerminalApp extends StatefulWidget {
  const TerminalApp({Key? key}) : super(key: key);

  @override
  _TerminalAppState createState() => _TerminalAppState();
}

class _TerminalAppState extends State<TerminalApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp(
            title: "The Terminal",
            theme: state.themeData,
            home: const CartPage(),
          );
        },
      ),
    );
  }
}
