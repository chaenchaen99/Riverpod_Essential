import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:todo_riverpod_sync/pages/providers/todo_list/todo_list_state.dart';

class NewTodo extends ConsumerStatefulWidget {
  const NewTodo({super.key});

  @override
  ConsumerState<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends ConsumerState<NewTodo> {
  final newTodoController = TextEditingController();
  Widget prevWidget = SizedBox.shrink();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  bool enableOrNot(TodoListStatus status) {
    switch (status) {
      case TodoListStatus.failure when prevWidget is SizedBox:
      case TodoListStatus.loading || TodoListStatus.initial:
        return false;
      case _:
        prevWidget = Container();
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoListState = ref.watch(todoListProvider);
    return TextField(
      controller: newTodoController,
      decoration: InputDecoration(labelText: 'What to do?'),
      enabled: enableOrNot(todoListState.status),
      onSubmitted: (String? desc) {
        //사용자가 텍스트를 입력한 후 엔터를 눌렀을 때 호출됨
        if (desc != null && desc.trim().isNotEmpty) {
          ref.read(todoListProvider.notifier).addTodo(desc);
          newTodoController.clear();
        }
      },
    );
  }
}
