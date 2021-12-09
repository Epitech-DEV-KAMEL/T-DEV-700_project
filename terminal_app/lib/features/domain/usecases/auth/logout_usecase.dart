
import 'package:equatable/equatable.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/core/usecases/usecases.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';

class LogoutParams extends Equatable {
  const LogoutParams();

  @override
  List<Object?> get props => [];
}

class LogoutUsecase extends UseCases<AuthenticationStatus, LogoutParams> {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);
  
  @override
  Future<Either<Failure, AuthenticationStatus>> execute(params) {
    return authRepository.logout();
  }
}