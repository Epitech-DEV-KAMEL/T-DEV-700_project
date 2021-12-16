import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';
import 'package:terminal_app/features/presentation/bloc/authentication_bloc.dart';
import 'package:terminal_app/features/presentation/pages/auth_page.dart';
import 'package:terminal_app/features/presentation/pages/cart_page.dart';

class AuthRouter extends StatelessWidget {
  const AuthRouter({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          return const CartPage();
        } else {
          return const AuthPage();
        }
      }
    );
  }
}