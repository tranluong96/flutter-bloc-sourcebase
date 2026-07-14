import 'package:json_annotation/json_annotation.dart';

part 'presigned_url_response.g.dart';

/// Response for POST /api/v1/storage/presigned-url.
@JsonSerializable()
class PresignedUrlResponse {
  /// Absolute S3 URL to PUT the raw file bytes to (valid for `expiresIn` secs).
  final String uploadUrl;

  /// Stored file key (e.g. `pr/<uuid>.png`) to persist on the profile.
  final String fileUrl;

  const PresignedUrlResponse({required this.uploadUrl, required this.fileUrl});

  factory PresignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$PresignedUrlResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PresignedUrlResponseToJson(this);
}
