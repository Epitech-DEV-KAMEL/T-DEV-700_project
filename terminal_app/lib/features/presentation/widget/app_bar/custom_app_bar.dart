
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';
import 'package:terminal_app/features/presentation/bloc/authentication_bloc.dart';
import 'package:terminal_app/features/presentation/bloc/theme_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({ Key? key, required this.title }) : super(key: key);

  final String title;
  static const double toolbarHeigh = 80;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthenticationCubit>();

    return AppBar(
      centerTitle: true,
      toolbarHeight: toolbarHeigh,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.onBackground,
      elevation: 1,
      shadowColor: Theme.of(context).colorScheme.onBackground,
      title: Text(
        title, 
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
      actions: <Widget>[
        BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return IconButton(
              onPressed: () => context.read<ThemeBloc>().toogleState(),
              icon: Icon(
                state.appTheme == AppTheme.light ? Icons.dark_mode : Icons.light_mode
              ),
            );
          },
        ),
        if (authCubit.state.status == AuthenticationStatus.authenticated) IconButton(
          onPressed: () {
            authCubit.logout();
          },
          icon: const Icon(Icons.logout)
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(toolbarHeigh);
}