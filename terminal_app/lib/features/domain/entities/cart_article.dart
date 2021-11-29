
import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [id, amount];  
}