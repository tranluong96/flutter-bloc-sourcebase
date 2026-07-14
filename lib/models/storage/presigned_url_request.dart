import 'package:json_annotation/json_annotation.dart';

part 'presigned_url_request.g.dart';

/// Body for POST /api/v1/storage/presigned-url.
///
/// The server returns a short-lived S3 PUT URL ([PresignedUrlResponse.uploadUrl])
/// the client uploads the raw file bytes to, plus the stored file key
/// ([PresignedUrlResponse.fileUrl]) to keep on the profile.
@JsonSerializable()
class PresignedUrlRequest {
  final String fileName;
  final String contentType;

  /// Seconds the upload URL stays valid. Defaults to 300 (5 min).
  final int expiresIn;

  const PresignedUrlRequest({
    required this.fileName,
    required this.contentType,
    this.expiresIn = 300,
  });

  factory PresignedUrlRequest.fromJson(Map<String, dynamic> json) =>
      _$PresignedUrlRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PresignedUrlRequestToJson(this);
}
