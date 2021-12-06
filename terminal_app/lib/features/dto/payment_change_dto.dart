
import 'package:terminal_app/features/domain/entities/bank_card.dart';
import 'package:terminal_app/features/domain/entities/cheque.dart';
import 'package:terminal_app/features/domain/entities/payment_methods.dart';

class PaymentInformations {
  final PaymentMethods paymentMethods;
  final BankCard? card;
  final Cheque? cheque;

  const PaymentInformations({required this.paymentMethods, this.card, this.cheque}) 
    : assert((paymentMethods == PaymentMethods.card && card != null) || (paymentMethods == PaymentMethods.cheque && cheque != null));

  bool get isByCard => card != null;
  bool get isByCheque => cheque != null;
}