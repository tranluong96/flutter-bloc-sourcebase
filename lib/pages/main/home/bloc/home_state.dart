import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

enum HomeStatus { initial, loading, loaded, update, error }

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required HomeStatus status,
    Object? error,
    required int count,
    required bool isEnglish,
  }) = _HomeState;

  const HomeState._();

  

  factory HomeState.initial() => HomeState(
        status: HomeStatus.initial,
        count: 0,
        isEnglish: true,
      );
}
