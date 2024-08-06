import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'emailAddress': emailAddress,
    };
  }

  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      emailAddress: map['emailAddress'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Person.fromJson(String source) => Person.fromMap(json.decode(source));

  @override
  String toString() =>
      'Person(id: $id, name: $name, emailAddress: $emailAddress)';

  @override
  List<Object> get props => [id, name, emailAddress];
}
