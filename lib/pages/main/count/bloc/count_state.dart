import 'package:freezed_annotation/freezed_annotation.dart';
part 'count_state.freezed.dart';

enum CountStatus { initial, loading, success, error }

@freezed
class CountState with _$CountState {
  factory CountState({
    required CountStatus status,
    required int count,
    Object? error,
  }) = _CountState;

  const CountState._();

  factory CountState.initial() => CountState(
        status: CountStatus.initial,
        count: 0,
      );
}
