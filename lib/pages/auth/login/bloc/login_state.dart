import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  failure,
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default(true) bool isObscure,
    @Default(LoginStatus.initial) LoginStatus status,
    String? errorMessage,
    String? emailError,
    String? passwordError,
    bool? isValidationSubmit,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState();
}
