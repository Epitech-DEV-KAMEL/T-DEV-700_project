
import 'package:dartz/dartz.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:terminal_app/core/error/failure.dart';

abstract class ArticleRepository {
  Future<Either<Failure, Article>> getArticleById(int id);
}