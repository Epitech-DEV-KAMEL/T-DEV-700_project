
import 'package:equatable/equatable.dart';

class Cheque extends Equatable {
  final int id;
  final String token;
  final double amount;

  const Cheque({
    required this.id, 
    required this.token, 
    required this.amount
  });

  Cheque.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      token = json['token'],
      amount = json['amount'];

  @override
  List<Object?> get props => [id, token, amount];  
}