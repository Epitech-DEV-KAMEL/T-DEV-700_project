
import 'package:dartz/dartz.dart';
import 'package:terminal_app/core/error/failure.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

abstract class AuthRepository {
  Future<Either<Failure, AuthenticationStatus>> login({
    required String locality,
    required String password,
  });

  Future<Either<Failure, AuthenticationStatus>> logout();
}