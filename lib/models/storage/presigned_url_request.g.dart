// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presigned_url_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresignedUrlRequest _$PresignedUrlRequestFromJson(Map<String, dynamic> json) =>
    PresignedUrlRequest(
      fileName: json['fileName'] as String,
      contentType: json['contentType'] as String,
      expiresIn: (json['expiresIn'] as num?)?.toInt() ?? 300,
    );

Map<String, dynamic> _$PresignedUrlRequestToJson(
  PresignedUrlRequest instance,
) => <String, dynamic>{
  'fileName': instance.fileName,
  'contentType': instance.contentType,
  'expiresIn': instance.expiresIn,
};
