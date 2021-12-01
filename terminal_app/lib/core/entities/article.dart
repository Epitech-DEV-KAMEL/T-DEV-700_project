
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;

  const Article({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id];

  Article.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      description = json['description'],
      price = json['price'];

  @override
  String toString() {
    return 'Article { id: $id, price: $price, name: $name, $description: $description }';
  }
}