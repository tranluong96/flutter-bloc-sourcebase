// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presigned_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresignedUrlResponse _$PresignedUrlResponseFromJson(
  Map<String, dynamic> json,
) => PresignedUrlResponse(
  uploadUrl: json['uploadUrl'] as String,
  fileUrl: json['fileUrl'] as String,
);

Map<String, dynamic> _$PresignedUrlResponseToJson(
  PresignedUrlResponse instance,
) => <String, dynamic>{
  'uploadUrl': instance.uploadUrl,
  'fileUrl': instance.fileUrl,
};
