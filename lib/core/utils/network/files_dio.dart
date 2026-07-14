import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:my_app/core/utils/network/rest_client.dart';
import 'package:my_app/models/storage/presigned_url_request.dart';

class FilesDIO {
  final RestClient api;

  FilesDIO(this.api);

  /// Uploads [bytes] to S3 via a presigned URL and returns the stored file key
  /// (`fileUrl`, e.g. `pr/<uuid>.png`) to persist on the profile.
  ///
  /// Step 1 asks the API for a presigned PUT URL. Step 2 PUTs the raw bytes
  /// straight to S3 using a bare [Dio] — the app's [AppInterceptor] is
  /// intentionally bypassed so it doesn't attach the `Authorization` header,
  /// which would clash with the URL's query-string signature.
  Future<String> uploadFileToStorage({
    required Uint8List bytes,
    required String fileName,
    required String contentType,
    CancelToken? cancelToken,
  }) async {
    final presigned = await api.createPresignedUrl(
      PresignedUrlRequest(fileName: fileName, contentType: contentType),
      cancelToken,
    );

    await Dio().put(
      presigned.uploadUrl,
      data: Stream.fromIterable([bytes]),
      cancelToken: cancelToken,
      options: Options(
        contentType: contentType,
        headers: {Headers.contentLengthHeader: bytes.length},
      ),
    );

    return presigned.fileUrl;
  }

  /// Downloads the file at [url] to [savePath]. Uses a bare [Dio] so the app's
  /// [AppInterceptor] doesn't attach an `Authorization` header that would clash
  /// with the presigned URL's query-string signature.
  Future<void> downloadFile({
    required String url,
    required String savePath,
    CancelToken? cancelToken,
  }) async {
    await Dio().download(url, savePath, cancelToken: cancelToken);
  }
}
