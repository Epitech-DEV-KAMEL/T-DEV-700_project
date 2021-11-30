
import 'package:equatable/equatable.dart';
import 'package:terminal_app/core/entities/article.dart';

class CartArticle extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final int amount;

  const CartArticle({
    required this.id, 
    required this.name, 
    required this.description, 
    required this.price, 
    required this.amount
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

  CartArticle copyWith({int? amount}) {
    return CartArticle(
      id: id,
      name: name,
      description: description,
      price: price,
      amount: amount ?? this.amount
    );
  }

  CartArticle add(int amount) {
    return CartArticle(
      id: id,
      name: name,
      description: description,
      price: price,
      amount: this.amount + amount
    );
  }

  @override
  List<Object?> get props => [id, amount];  
}