import 'package:flutter/material.dart';
import 'package:todo_riverpod_sync/pages/widgets/new_todo.dart';
import 'package:todo_riverpod_sync/pages/widgets/search_todo.dart';

import 'widgets/filter_todo.dart';
import 'widgets/show_todos.dart';
import 'widgets/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              TodoHeader(),
              NewTodo(),
              SizedBox(height: 20),
              SearchTodo(),
              SizedBox(height: 10),
              FilterTodo(),
              Expanded(child: ShowTodos()),
            ],
          ),
        ),
      ),
    );
  }
}
