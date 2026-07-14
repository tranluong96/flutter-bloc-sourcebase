// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInput _$LoginInputFromJson(Map<String, dynamic> json) => LoginInput(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$LoginInputToJson(LoginInput instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

UserOutput _$UserOutputFromJson(Map<String, dynamic> json) => UserOutput(
  data: User.fromJson(json['data'] as Map<String, dynamic>),
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
);

Map<String, dynamic> _$UserOutputToJson(UserOutput instance) =>
    <String, dynamic>{
      'data': instance.data,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
