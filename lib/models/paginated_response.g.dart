// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    PaginatedResponse<T>(
      data: fromJsonT(json['data']),
      count: json['count'] as int,
      total: json['total'] as int,
      page: json['page'] as int,
      pageCount: json['pageCount'] as int,
    );

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'count': instance.count,
      'total': instance.total,
      'page': instance.page,
      'pageCount': instance.pageCount,
    };
