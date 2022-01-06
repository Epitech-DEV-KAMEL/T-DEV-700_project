
import 'package:terminal_app/features/data/models/order_article.dart';
import 'package:terminal_app/features/domain/entities/bank_card.dart';

class PaymentByCardDto {
  final BankCard bankCard;
  final List<OrderArticle> orderArticles;

  const PaymentByCardDto({
    required this.bankCard,
    required this.orderArticles,
  });

  factory PaymentByCardDto.fromJson(Map<String, dynamic> json) {
    return PaymentByCardDto(
      bankCard: BankCard.fromJson(json['card']),
      orderArticles: json['orderArticles'].map((articleJson) => OrderArticle.fromJson(articleJson))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'card': bankCard.toJson(),
      'orderArticles': orderArticles.map((article) => article.toJson()).toList(),
    };
  }
}