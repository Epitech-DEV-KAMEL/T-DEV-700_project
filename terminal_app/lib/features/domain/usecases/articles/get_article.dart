
import 'package:equatable/equatable.dart';
import 'package:terminal_app/core/entities/article.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/core/usecases/usecases.dart';
import 'package:terminal_app/features/domain/repositories/article_repository.dart';

class GetArticleParams extends Equatable {
  final int id;

  const GetArticleParams({required this.id});

  @override
  List<Object?> get props => [id];
}

class GetArticle extends UseCases<Article, GetArticleParams> {
  final ArticleRepository articleRepository;

  GetArticle(this.articleRepository);
  
  @override
  Future<Either<Failure, Article>> execute(params) {
    return articleRepository.getArticleById(params.id);
  }

}