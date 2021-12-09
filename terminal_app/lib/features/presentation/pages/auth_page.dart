
import 'package:flutter/material.dart';
import 'package:terminal_app/features/presentation/widget/app_bar/custom_app_bar.dart';
import 'package:terminal_app/features/presentation/widget/auth/login_form.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({ Key? key }) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Login"),
      body: LoginForm()
    );
  }
}