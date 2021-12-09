
import 'package:terminal_app/features/domain/entities/cheque.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/features/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<Either<Failure, bool>> payByCard(List<CartArticle> articles, BankCard bankCard) {
    // TODO: implement payByCard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> payByCheque(List<CartArticle> articles, Cheque cheque) {
    // TODO: implement payByCheque
    throw UnimplementedError();
  }
  
}