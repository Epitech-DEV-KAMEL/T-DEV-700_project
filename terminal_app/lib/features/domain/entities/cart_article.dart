
import 'package:terminal_app/core/entities/article.dart';

class CartArticle {
  final int id;
  final String name;
  final String description;
  final double price;
  int amount;

  CartArticle({
    required this.id, 
    required this.name, 
    required this.description, 
    required this.price, 
    this.amount = 0
  });

  static CartArticle fromEntity(Article article, int amount) {
    return CartArticle(
      id: article.id,
      name: article.name,
      description: article.description,
      price: article.price,
      amount: amount
    );
  }

  bool equals(Object? o1, Object? o2) {
    if (o1 == null) return false;
    if (o2 == null) return false;

    if (o1 is! CartArticle) return false;
    if (o2 is! CartArticle) return false;

    CartArticle cartArticle1 = o1;
    CartArticle cartArticle2 = o2;

    if (cartArticle1.id != cartArticle2.id) return false;
    if (cartArticle1.amount != cartArticle2.amount) return false;
    return true;
  }
}