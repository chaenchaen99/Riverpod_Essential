import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
//uuid: 각 todo를 unique하게 구분할 string type의 id를 생성하기 위해

part 'todo_model.freezed.dart';

Uuid uuid = Uuid();

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String desc,
    @Default(false) bool completed,
  }) = _Todo;

  factory Todo.add({required String desc}) {
    return Todo(id: uuid.v4(), desc: desc);
  }
}

enum Filter {
  all,
  active,
  completed,
}
