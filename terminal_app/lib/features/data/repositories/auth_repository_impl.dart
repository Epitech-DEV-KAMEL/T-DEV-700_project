
import 'package:terminal_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/features/data/datasources/api_datasource.dart';
import 'package:terminal_app/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  final ApiDatasource apiDatasource;
  const AuthRepositoryImpl(this.apiDatasource);

  @override
  Future<Either<Failure, AuthenticationStatus>> login({required String locality, required String password}) {
    // TODO: implement login
    return Future.value(const Right(AuthenticationStatus.authenticated));
    //throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AuthenticationStatus>> logout() {
    // TODO: implement logout
    return Future.value(const Right(AuthenticationStatus.unauthenticated));
  }
  
}