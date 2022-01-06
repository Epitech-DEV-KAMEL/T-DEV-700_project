
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';
import 'package:terminal_app/features/domain/usecases/auth/login_usecase.dart';
import 'package:terminal_app/features/domain/usecases/auth/logout_usecase.dart';

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

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final LoginUsecase _loginUsecase;
  final LogoutUsecase _logoutUsecase;
  
  AuthenticationCubit({
    required LoginUsecase loginUsecase,
    required LogoutUsecase logoutUsecase
  }) : _loginUsecase = loginUsecase,
       _logoutUsecase = logoutUsecase,
      super(const AuthenticationState.unknown());
  
  void login(String locality, String password) async {
    var result = await _loginUsecase.execute(LoginParams(locality, password));

    result.fold(
      (failure) => emit(const AuthenticationState.unauthenticated()), 
      (status) => emit(AuthenticationState._(status: status))
    );
  }

  void logout() async {
    var result = await _logoutUsecase.execute(const LogoutParams());

    result.fold(
      (failure) => null, 
      (status) => emit(AuthenticationState._(status: status))
    );
  }
}