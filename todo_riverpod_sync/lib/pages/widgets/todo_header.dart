import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';
import 'package:todo_riverpod_sync/pages/theme/theme_provider.dart';

import '../../models/todo_model.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  int getActiveTodoCount(List<Todo> todos) {
    return todos.where((todo) => !todo.completed).toList().length;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoListState = ref.watch(todoListProvider);
    final activeTodoCount = getActiveTodoCount(todoListState.todos);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'TODO',
              style: TextStyle(
                fontSize: 36.0,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              '($activeTodoCount/${todoListState.todos.length} item${activeTodoCount != 1 ? "s" : ""} left)',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              onPressed: todoListState.status == TodoListStatus.loading
                  ? null
                  : () {
                      ref.read(themeProvider.notifier).toggleTheme();
                    },
              icon: Icon(Icons.light_mode),
            ),
            SizedBox(width: 10),
            IconButton(
              onPressed: todoListState.status == TodoListStatus.loading
                  ? null
                  : () {
                      ref.read(todoListProvider.notifier).getTodos();
                    },
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
      ],
    );
  }
}
