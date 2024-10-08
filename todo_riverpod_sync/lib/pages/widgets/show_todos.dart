import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_item/todo_item_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';
import 'package:todo_riverpod_sync/pages/widgets/todo_item.dart';

import '../../models/todo_model.dart';
import '../providers/todo_filter/todo_filter_provider.dart';
import '../providers/todo_search/todo_search_provider.dart';

class ShowTodos extends ConsumerStatefulWidget {
  const ShowTodos({super.key});

  @override
  ConsumerState<ShowTodos> createState() => _ShowTodosState();
}

class _ShowTodosState extends ConsumerState<ShowTodos> {
  Widget prevTodosWidget = const SizedBox.shrink();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(todoListProvider.notifier).getTodos();
    });
  }

  List<Todo> filterTodos(List<Todo> allTodos) {
    final filter = ref.watch(todoFilterProvider);
    final search = ref.watch(todoSearchProvider);

    List<Todo> tempTodos;
    tempTodos = switch (filter) {
      //사용자가 todo "완료/미완료/모든" 버튼을 클릭했을때 제공할 리스트 필터링
      Filter.active => allTodos.where((todo) => !todo.completed).toList(),
      Filter.completed => allTodos.where((todo) => todo.completed).toList(),
      Filter.all => allTodos,
    };

    if (search.isNotEmpty) {
      tempTodos = tempTodos
          .where(
              (todo) => todo.desc.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    return tempTodos;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<TodoListState>(todoListProvider, (previous, next) {
      if (next.status == TodoListStatus.failure) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  'Error',
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  next.error,
                  textAlign: TextAlign.center,
                ),
              );
            });
      }
    });

    final todoListState = ref.watch(todoListProvider);

    switch (todoListState.status) {
      case TodoListStatus.initial:
        return SizedBox.shrink();
      case TodoListStatus.loading:
        return prevTodosWidget;
      case TodoListStatus.failure when prevTodosWidget is SizedBox:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                todoListState.error,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  ref.read(todoListProvider.notifier).getTodos();
                },
                child: Text(
                  'Please Retry!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        );
      case TodoListStatus.failure:
        return prevTodosWidget;
      case TodoListStatus.success:
        final filteredTodos = filterTodos(todoListState.todos);

        prevTodosWidget = ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final todo = filteredTodos[index];
              return ProviderScope(overrides: [
                todoItemProvider.overrideWithValue(todo),
              ], child: const TodoItem());
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(color: Colors.grey);
            },
            itemCount: filteredTodos.length);
        return prevTodosWidget;
    }
  }
}
