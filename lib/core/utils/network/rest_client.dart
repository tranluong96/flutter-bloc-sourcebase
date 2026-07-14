import 'package:my_app/core/utils/network/api_extra_keys.dart';
import 'package:my_app/core/utils/network/app_endpoints.dart';
import 'package:my_app/models/auth/login_model.dart';
import 'package:my_app/models/storage/presigned_url_request.dart';
import 'package:my_app/models/storage/presigned_url_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  /// Ví dụ: bật loading toàn cục cho request này. Muốn tự xử lý lỗi ở page thì
  /// thêm `ApiExtraKeys.skipError: true`.
  @Extra({ApiExtraKeys.showLoading: true})
  @POST(APPEndpoints.loginAPI)
  Future<UserOutput> loginAPI(
    @Body() LoginInput input,
    @CancelRequest() CancelToken? cancelToken,
  );

  // Storage
  @POST(APPEndpoints.presignedUrl)
  Future<PresignedUrlResponse> createPresignedUrl(
    @Body() PresignedUrlRequest request,
    @CancelRequest() CancelToken? cancelToken,
  );
}
