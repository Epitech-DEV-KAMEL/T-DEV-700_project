import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:terminal_app/app.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/presentation/bloc/theme_bloc.dart';
import 'package:terminal_app/injection_container.dart';

import 'features/domain/usecases/auth/login_usecase.dart';
import 'features/domain/usecases/auth/logout_usecase.dart';
import 'features/presentation/bloc/authentication_bloc.dart';

void main() {
  init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(
            loginUsecase: sl<LoginUsecase>(), 
            logoutUsecase: sl<LogoutUsecase>()
          ),
        ),
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
      ], 
      child: ChangeNotifierProvider(
        create: (context) => Cart(),
        child: const TerminalApp(),
      )
    )
  );
}