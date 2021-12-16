
import 'package:terminal_app/features/data/models/order_article.dart';
import 'package:terminal_app/features/data/models/order_dto.dart';
import 'package:terminal_app/features/data/models/payment_by_card_dto.dart';
import 'package:terminal_app/features/data/models/payment_by_cheque_dto.dart';
import 'package:terminal_app/features/domain/entities/cheque.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:terminal_app/features/domain/repositories/payment_repository.dart';

class PaymentRepositoryImpl implements PaymentRepository {
  @override
  Future<Either<Failure, bool>> payByCard(List<CartArticle> articles, BankCard bankCard) {
    final data = PaymentByCardDto(
      bankCard: bankCard, 
      order: OrderDto(articles: articles.map((article) => OrderArticle(id: article.id, amount: article.amount)).toList())
    );

    // TODO: implement payByCard
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> payByCheque(List<CartArticle> articles, Cheque cheque) {
    final data = PaymentByChequeDto(
      chequeId: cheque.id,
      order: OrderDto(articles: articles.map((article) => OrderArticle(id: article.id, amount: article.amount)).toList())
    );
    
    // TODO: implement payByCheque
    throw UnimplementedError();
  }
  
}