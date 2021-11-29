
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
}