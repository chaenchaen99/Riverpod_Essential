import 'package:equatable/equatable.dart';

class Person extends Equatable {
  final int id;
  final String name;
  final String emailAddress;

  const Person({
    required this.id,
    required this.name,
    required this.emailAddress,
  });

  @override
  String toString() =>
      'Person(id: $id, name: $name, emailAddress: $emailAddress)';

  Person copyWith({
    int? id,
    String? name,
    String? emailAddress,
  }) {
    return Person(
      id: id ?? this.id,
      name: name ?? this.name,
      emailAddress: emailAddress ?? this.emailAddress,
    );
  }

  @override
  List<Object> get props => [id, name, emailAddress];
}
