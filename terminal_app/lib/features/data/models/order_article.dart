
import 'package:terminal_app/features/domain/entities/cart_article.dart';

class OrderArticle {
  final int id;
  final int amount;

  const OrderArticle({
    required this.id,
    required this.amount
  });

  OrderArticle.fromCartArticle(CartArticle cartArticle)
    : id = cartArticle.id,
      amount = cartArticle.amount;
  
}