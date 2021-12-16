
import 'package:terminal_app/features/data/models/order_dto.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';

class PaymentByCardDto {
  final BankCard bankCard;
  final OrderDto order;

  const PaymentByCardDto({
    required this.bankCard,
    required this.order,
  });

  factory PaymentByCardDto.fromJson(Map<String, dynamic> json) {
    return PaymentByCardDto(
      bankCard: BankCard.fromJson(json['bankCard']),
      order: OrderDto.fromJson(json['order']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bankCard': bankCard.toJson(),
      'order': order.toJson(),
    };
  }
}