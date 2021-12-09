
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:terminal_app/core/error/failure.dart';
import 'package:terminal_app/core/usecases/usecases.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/features/domain/entities/cart_article.dart';
import 'package:terminal_app/features/domain/entities/cheque.dart';
import 'package:terminal_app/features/domain/repositories/payment_repository.dart';
import 'package:terminal_app/features/dto/payment_informations.dart';

class PayParams extends Equatable {
  final List<CartArticle> cartArticles;
  final PaymentInformations paymentInformations;

  const PayParams(this.cartArticles, this.paymentInformations);

  @override
  List<Object?> get props => [cartArticles, paymentInformations];
}

class PayUsecase extends UseCases<bool, PayParams> {
  final PaymentRepository paymentRespository;

  PayUsecase(this.paymentRespository);

  @override
  Future<Either<Failure, bool>> execute(PayParams params) {
    if (params.paymentInformations.isByCard) {
      return paymentRespository.payByCard(params.cartArticles, params.paymentInformations.card as BankCard);
    } else {
      return paymentRespository.payByCheque(params.cartArticles, params.paymentInformations.cheque as Cheque);
    }
  }
}