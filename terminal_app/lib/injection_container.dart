
import 'package:get_it/get_it.dart';
import 'package:terminal_app/features/data/repositories/article_repository_impl.dart';
import 'package:terminal_app/features/data/repositories/payment_repository_impl.dart';
import 'package:terminal_app/features/domain/repositories/article_repository.dart';
import 'package:terminal_app/features/domain/repositories/payment_repository.dart';
import 'package:terminal_app/features/domain/usecases/articles/get_article.dart';
import 'package:terminal_app/features/domain/usecases/pay/pay_usecase.dart';

final sl = GetIt.instance;

void init() {
  sl.registerLazySingleton<PaymentRepository>(() => PaymentRepositoryImpl());
  sl.registerLazySingleton<PayUsecase>(() => PayUsecase(sl()));

  sl.registerLazySingleton<ArticleRepository>(() => ArticleRepositoryImpl());
  sl.registerLazySingleton<GetArticle>(() => GetArticle(sl()));
}