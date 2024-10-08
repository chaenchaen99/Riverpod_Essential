import 'package:dart_data_class_generator/models/person.dart';
import 'package:flutter/material.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    const person1 = Person(id: 1, name: 'john', emailAddress: 'john@gmail.com');
    final person2 = person1.copyWith(id: 2, emailAddress: 'john@gmail.com');
    const person3 = Person(id: 1, name: 'john', emailAddress: 'john@gmail.com');
    print(person1);
    print(person2);
    print(person1 == person3);
    print(person1.hashCode);
    print(person3.hashCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person'),
      ),
    );
  }
}
