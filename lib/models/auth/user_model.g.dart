// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['deletedAt'] as String?,
      id: json['id'] as String,
      fullname: json['fullname'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      role: $enumDecode(_$RoleEnumMap, json['role']),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'username': instance.username,
      'email': instance.email,
      'role': _$RoleEnumMap[instance.role]!,
      'isActive': instance.isActive,
      'deletedAt': instance.deletedAt,
    };

const _$RoleEnumMap = {
  Role.admin: 'admin',
  Role.user: 'user',
};
