import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/filtered_todos/filtered_todos_provider.dart';
import 'package:todo_riverpod_sync/pages/widgets/todo_item.dart';

class ShowTodos extends ConsumerWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterTodos = ref.watch(filtedTodosProvider);

    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          final todo = filterTodos[index];
          return TodoItem(todo: todo);
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(color: Colors.grey);
        },
        itemCount: filterTodos.length);
  }
}
