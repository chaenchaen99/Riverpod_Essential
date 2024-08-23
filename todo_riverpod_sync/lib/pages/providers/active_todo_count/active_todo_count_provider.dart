import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';

part 'active_todo_count_provider.g.dart';

@riverpod
int activeTodoCount(ActiveTodoCountRef ref) {
  final todoListState = ref.watch(todoListProvider);
  return todoListState.todos.where((todo) => !todo.completed).toList().length;
}
