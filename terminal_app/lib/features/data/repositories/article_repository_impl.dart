
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:terminal_app/core/error/failure.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/features/data/datasources/api_datasource.dart';
import 'package:terminal_app/features/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<Either<Failure, Article>> getArticleById(int id) async {
    final response = await http.get(Uri.parse("${ApiDatasource.baseUrl}/articles/$id"));
    if (response.statusCode == 200) {
      return Right(Article.fromJson(json.decode(response.body)));
    } else {
      return Left(ServerFailure());
    }
  }    
}