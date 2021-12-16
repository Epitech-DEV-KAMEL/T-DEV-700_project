
import 'package:terminal_app/features/data/models/order_article.dart';

class PaymentByChequeDto {
  final String chequeId;
  final List<OrderArticle> orderArticles;

  const PaymentByChequeDto({
    required this.chequeId, 
    required this.orderArticles
  });

  factory PaymentByChequeDto.fromJson(Map<String, dynamic> json) {
    return PaymentByChequeDto(
      chequeId: json['chequeId'],
      orderArticles: json['orderArticles'].map((articleJson) => OrderArticle.fromJson(articleJson))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chequeId': chequeId,
      'orderArticles': orderArticles.map((article) => article.toJson()).toList(),
    };
  }
}