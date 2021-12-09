
import 'package:equatable/equatable.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/core/usecases/usecases.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';

class LoginParams extends Equatable {
  const LoginParams(this.locality, this.password);

  final String locality;
  final String password;

  @override
  List<Object?> get props => [locality, password];
}

class LoginUsecase extends UseCases<AuthenticationStatus, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);
  
  @override
  Future<Either<Failure, AuthenticationStatus>> execute(params) {
    return authRepository.login(locality: params.locality, password: params.password);
  }
}