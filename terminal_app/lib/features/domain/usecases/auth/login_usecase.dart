
import 'package:equatable/equatable.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/core/usecases/usecases.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';
import 'package:terminal_app/features/presentation/bloc/authentication_bloc.dart';

class LoginParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginUsecase extends UseCases<AuthenticationStatus, LoginParams> {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);
  
  @override
  Future<Either<Failure, AuthenticationStatus>> execute(params) {
    // TODO: implement login usecase
    throw UnimplementedError();
  }
}