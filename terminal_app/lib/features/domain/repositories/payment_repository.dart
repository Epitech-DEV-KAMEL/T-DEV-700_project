
import 'package:dartz/dartz.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:terminal_app/features/data/models/order.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/features/domain/entities/cart.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';
import 'package:terminal_app/features/domain/entities/cheque.dart';
import 'package:terminal_app/features/dto/payment_informations.dart';

abstract class PaymentRepository {
  Future<Either<Failure, bool>> payByCard(List<CartArticle> articles, BankCard bankCard);
  Future<Either<Failure, bool>> payByCheque(List<CartArticle> articles, Cheque cheque);
}