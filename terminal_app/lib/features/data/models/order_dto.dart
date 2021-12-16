
import 'package:terminal_app/features/data/models/order_article.dart';

class OrderDto {
  final List<OrderArticle> articles;

  const OrderDto({ 
    required this.articles
  });

  factory OrderDto.fromJson(Map<String, dynamic> json) {
    return OrderDto(
      articles: json['articles'].map((articleJson) => OrderArticle.fromJson(articleJson))
    );
  }

  Map<String, dynamic> toJson() => {
    'articles': articles.map((article) => article.toJson()).toList()
  };
}