
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:terminal_app/features/data/datasources/api_datasource.dart';
import 'package:terminal_app/features/data/models/order_article.dart';
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
  Future<Either<Failure, bool>> payByCard(List<CartArticle> articles, BankCard bankCard) async {
    final data = PaymentByCardDto(
      bankCard: bankCard, 
      orderArticles: articles.map((article) => OrderArticle(id: article.id, amount: article.amount)).toList()
    );

    final response = await http.post(Uri.parse("${ApiDatasource.baseUrl}/pay/card"), body: data);
    if (response.statusCode == 202) {
      return const Right(true);
    } else if (response.statusCode == 406) {
      return const Right(false);
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> payByCheque(List<CartArticle> articles, Cheque cheque) async {
    final data = PaymentByChequeDto(
      chequeId: cheque.id,
      orderArticles: articles.map((article) => OrderArticle(id: article.id, amount: article.amount)).toList()
    );
    
    final response = await http.post(Uri.parse("${ApiDatasource.baseUrl}/pay/cheque"), body: data);
    if (response.statusCode == 202) {
      return const Right(true);
    } else if (response.statusCode == 406) {
      return const Right(false);
    } else {
      return Left(ServerFailure());
    }
  }
}