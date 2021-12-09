
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:terminal_app/core/themes/common_style.dart';
import 'package:terminal_app/core/widgets/core_elevated_button/core_elevated_button.dart';
import 'package:terminal_app/features/presentation/bloc/authentication_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final localityController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: localityController,
              decoration: CommonStyle.inputDecoration(context, label: "Locality"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a text';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              autocorrect: false,
              obscureText: true,
              decoration: CommonStyle.inputDecoration(context, label: "Password"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a text';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            CoreElevatedButton(
              text: "Login",
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthenticationCubit>().login(localityController.text, passwordController.text);
                }
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    localityController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}