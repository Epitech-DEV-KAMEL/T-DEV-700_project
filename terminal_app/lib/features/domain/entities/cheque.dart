import 'package:equatable/equatable.dart';

class Cheque extends Equatable {
  final String id;

  const Cheque({required this.id});

  Cheque.fromJson(Map<String, dynamic> json) : id = json['id'];

  Map<String, dynamic> toJson() => {
    'id': id,
  };

  @override
  List<Object?> get props => [id];
}
