// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedResponse<T> _$PaginatedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => PaginatedResponse<T>(
  data: fromJsonT(json['data']),
  count: (json['count'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  page: (json['page'] as num).toInt(),
  pageCount: (json['pageCount'] as num).toInt(),
);

Map<String, dynamic> _$PaginatedResponseToJson<T>(
  PaginatedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'data': toJsonT(instance.data),
  'count': instance.count,
  'total': instance.total,
  'page': instance.page,
  'pageCount': instance.pageCount,
};
