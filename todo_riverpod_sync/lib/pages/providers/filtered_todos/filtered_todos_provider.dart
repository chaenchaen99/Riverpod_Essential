import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_filter/todo_filter_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_search/todo_search_provider.dart';

import '../../../models/todo_model.dart';

part 'filtered_todos_provider.g.dart';

@riverpod
List<Todo> filtedTodos(FiltedTodosRef ref) {
  final todos = ref.watch(todoListProvider);
  final filter = ref.watch(todoFilterProvider);
  final search = ref.watch(todoSearchProvider);

  List<Todo> tempTodos;
  tempTodos = switch (filter) {
    Filter.active => todos.where((todo) => !todo.completed).toList(),
    Filter.completed => todos.where((todo) => todo.completed).toList(),
    Filter.all => todos,
  };

  if (search.isNotEmpty) {
    tempTodos = tempTodos
        .where((todo) => todo.desc.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
  return tempTodos;
}
