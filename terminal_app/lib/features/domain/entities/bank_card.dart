
import 'package:equatable/equatable.dart';

class BankCard extends Equatable {
  final String accountNumber;
  final String cardholderName;
  final String cardSecurityCode;
  final String brandMark;
  final DateTime expirationDate;

  const BankCard({
    required this.accountNumber,
    required this.cardholderName,
    required this.cardSecurityCode,
    required this.brandMark,
    required this.expirationDate
  });

  @override
  List<Object?> get props => [accountNumber, cardholderName, cardSecurityCode, brandMark, expirationDate];
}