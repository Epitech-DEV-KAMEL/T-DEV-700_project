
import 'package:terminal_app/features/data/models/order_article.dart';

class Order {
  final List<OrderArticle> articles;

  const Order({ 
    required this.articles
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      articles: json['articles'].map((articleJson) => OrderArticle.fromJson(articleJson))
    );
  }

  Map<String, dynamic> toJson() => {
    'articles': articles.map((article) => article.toJson()).toList()
  };
}