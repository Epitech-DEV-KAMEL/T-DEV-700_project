
import 'dart:async';
import 'dart:convert';
import 'package:terminal_app/core/error/failure.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/features/data/datasources/api_datasource.dart';
import 'package:terminal_app/features/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ApiDatasource apiDatasource;
  const ArticleRepositoryImpl(this.apiDatasource);

  @override
  Future<Either<Failure, Article>> getArticleById(int id) async {
    final response = await apiDatasource.get("/articles/$id");
    if (response.statusCode == 200) {
      return Right(Article.fromJson(json.decode(response.body)));
    } else {
      return Left(ServerFailure());
    }
  }    
}