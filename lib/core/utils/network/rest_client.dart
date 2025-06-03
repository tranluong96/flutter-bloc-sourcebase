import 'package:my_app/core/utils/network/app_endpoints.dart';
import 'package:my_app/models/auth/login_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @Extra({
  })

  @POST(APPEndpoints.loginAPI)
  Future<UserOutput> loginAPI(
    @Body() LoginInput input,
  );
}
