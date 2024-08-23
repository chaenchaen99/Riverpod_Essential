import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_riverpod_sync/models/todo_model.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';
import 'package:todo_riverpod_sync/pages/repository/providers/todo_repository_provider.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  TodoListState build() {
    return TodoListState.initial();
  }

  Future<void> getTodos() async {
    state = state.copyWith(status: TodoListStatus.loading);

    try {
      final todos = await ref.read(todoRepositoryProvider).getTodos();
      state = state.copyWith(status: TodoListStatus.success, todos: todos);
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.failure,
        error: e.toString(),
      );
    }
  }

  void addTodo(String desc) async {
    state = state.copyWith(status: TodoListStatus.loading);

    try {
      final newTodo = Todo.add(desc: desc);

      await ref.read(todoRepositoryProvider).addTodo(todo: newTodo);

      state = state.copyWith(
        status: TodoListStatus.success,
        todos: [...state.todos, newTodo],
      );
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.failure,
        error: e.toString(),
      );
    }
  }

  Future<void> editTodo(String id, String desc) async {
    state = state.copyWith(status: TodoListStatus.loading);

    try {
      await ref.read(todoRepositoryProvider).editTodo(id: id, desc: desc);

      state = state.copyWith(
        status: TodoListStatus.success,
        todos: [
          for (final todo in state.todos)
            if (todo.id == id) todo.copyWith(desc: desc) else todo
        ],
      );
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.failure,
        error: e.toString(),
      );
    }
  }

  void toggleTodo(String id) async {
    state = state.copyWith(status: TodoListStatus.loading);

    try {
      await ref.read(todoRepositoryProvider).toggleTodo(id: id);

      state = state.copyWith(
        status: TodoListStatus.success,
        todos: [
          for (final todo in state.todos)
            if (todo.id == id)
              todo.copyWith(completed: !todo.completed)
            else
              todo
        ],
      );
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.failure,
        error: e.toString(),
      );
    }
  }

  void removeTodo(String id) async {
    state = state.copyWith(status: TodoListStatus.loading);

    try {
      await ref.read(todoRepositoryProvider).removeTodo(id: id);

      state = state.copyWith(
        status: TodoListStatus.success,
        todos: [
          for (final todo in state.todos)
            if (todo.id != id) todo
        ],
      );
    } catch (e) {
      state = state.copyWith(
        status: TodoListStatus.failure,
        error: e.toString(),
      );
    }
  }
}
