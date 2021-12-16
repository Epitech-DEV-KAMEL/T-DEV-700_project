import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key, required this.message}) : super(key: key);
  final String message;

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    _popPage(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            widget.message,
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground)
          ),
        ),
      ),
    );
  }

  Future<void> _popPage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pop(context);
  }
}
