
import 'package:terminal_app/core/error/failure.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/features/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<Either<Failure, Article>> getArticleById(int id) {
    // TODO: implement getArticleById
    throw UnimplementedError();
  }
    
}