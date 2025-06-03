import 'package:json_annotation/json_annotation.dart';

part 'paginated_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<T> {
  final T data;
  final int count;
  final int total;
  final int page;
  final int pageCount;

  const PaginatedResponse({
    required this.data,
    required this.count,
    required this.total,
    required this.page,
    required this.pageCount,
  });

  // Factory constructor for JSON deserialization
  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);

  // Method for JSON serialization
  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$PaginatedResponseToJson(this, toJsonT);
}
