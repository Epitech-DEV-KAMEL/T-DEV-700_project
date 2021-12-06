
import 'package:equatable/equatable.dart';

class BankCard extends Equatable {
  final String accountNumber;
  final String cardholderName;
  final String cardSecurityCode;
  final String brandMark;
  final String expirationDate;

  const BankCard({
    required this.accountNumber,
    required this.cardholderName,
    required this.cardSecurityCode,
    required this.brandMark,
    required this.expirationDate
  });

  BankCard.fromJson(Map<String, dynamic> json)
    : accountNumber = json['accountNumber'],
      cardholderName = json['cardholderName'],
      cardSecurityCode = json['cardSecurityCode'],
      brandMark = json['brandMark'],
      expirationDate = json['expirationDate'];

  @override
  List<Object?> get props => [accountNumber, cardholderName, cardSecurityCode, brandMark, expirationDate];
}