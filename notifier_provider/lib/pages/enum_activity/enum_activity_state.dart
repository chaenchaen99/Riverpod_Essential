import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:notifier_provider/models/activity.dart';

part 'enum_activity_state.freezed.dart';

enum ActivityStaus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class EnumActivityState with _$EnumActivityState {
  const factory EnumActivityState({
    required ActivityStaus status,
    required Activity activity,
    required String error,
  }) = _EnumActivityState;

  factory EnumActivityState.initial() {
    return EnumActivityState(
      status: ActivityStaus.initial,
      activity: Activity.empty(),
      error: '',
    );
  }
}
