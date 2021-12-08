
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';
import 'package:terminal_app/features/domain/usecases/auth/login_usecase.dart';
import 'package:terminal_app/features/domain/usecases/auth/logout_usecase.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];  
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  const AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;

  @override
  List<Object?> get props => [status];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}


class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated()
    : this._(status: AuthenticationStatus.authenticated);

  const AuthenticationState.unauthenticated()
    : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status];
}

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final LogoutUsecase _logoutUsecase;
  final LoginUsecase _loginUsecase;
  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;

  AuthenticationBloc({
    required LoginUsecase loginUsecase,
    required LogoutUsecase logoutUsecase,
  }) : _loginUsecase = loginUsecase,
       _logoutUsecase = logoutUsecase,
       super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
  }

  Future<void> _onAuthenticationStatusChanged(AuthenticationStatusChanged event, Emitter<AuthenticationState> emit) {
    // TODO: implement
    throw UnimplementedError();
  }

  Future<void> _onAuthenticationLogoutRequested(AuthenticationLogoutRequested event, Emitter<AuthenticationState> emit) {
    // TODO: implement
    throw UnimplementedError();
  }
}