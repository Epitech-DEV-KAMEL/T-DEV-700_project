
import 'package:terminal_app/features/data/models/order_dto.dart';

class PaymentByChequeDto {
  final String chequeId;
  final OrderDto order;

  const PaymentByChequeDto({
    required this.chequeId, 
    required this.order
  });

  factory PaymentByChequeDto.fromJson(Map<String, dynamic> json) {
    return PaymentByChequeDto(
      chequeId: json['chequeId'],
      order: OrderDto.fromJson(json['order'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chequeId': chequeId,
      'order': order.toJson()
    };
  }
}