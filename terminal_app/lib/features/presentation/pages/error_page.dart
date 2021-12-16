import 'package:flutter/material.dart';

class ErrorPage extends StatefulWidget {
  const ErrorPage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  _ErrorPageState createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {

  @override
  Widget build(BuildContext context) {
    _popPage(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            widget.message,
            style: TextStyle(color: Theme.of(context).colorScheme.error)
          ),
        ),
      ),
    );
  }

  Future<void> _popPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);
  }
}
