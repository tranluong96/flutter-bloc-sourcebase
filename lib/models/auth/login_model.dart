import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/models/auth/user_model.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginInput {
  final String email;
  final String password;

  const LoginInput({
    required this.email,
    required this.password,
  });

  factory LoginInput.fromJson(Map<String, dynamic> json) =>
      _$LoginInputFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInputToJson(this);
}

@JsonSerializable()
class UserOutput {
  final User data;
  final String accessToken;
  final String refreshToken;

  const UserOutput({
    required this.data,
    required this.accessToken,
    required this.refreshToken,
  });

  factory UserOutput.fromJson(Map<String, dynamic> json) =>
      _$UserOutputFromJson(json);

  Map<String, dynamic> toJson() => _$UserOutputToJson(this);
}
