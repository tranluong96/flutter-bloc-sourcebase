import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/core/utils/configs/enum.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String fullname;
  final String username;
  final String email;
  final Role role;
  final bool isActive;
  final String? deletedAt;

  const User(
    this.deletedAt, {
    required this.id,
    required this.fullname,
    required this.username,
    required this.email,
    required this.role,
    required this.isActive,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
