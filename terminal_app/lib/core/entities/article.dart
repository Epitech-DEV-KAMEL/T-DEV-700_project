
import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final String name;
  final String description;
  final double price;
  final bool isAvailable;

  const Article({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.isAvailable
  });

  @override
  List<Object?> get props => [id];
}