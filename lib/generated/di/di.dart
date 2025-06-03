import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';
import 'package:my_app/core/utils/network/app_endpoints.dart';
import 'package:my_app/core/utils/network/auth_interceptor.dart';
import 'package:my_app/core/utils/network/logger_interceptor.dart';
import 'package:my_app/core/utils/network/rest_client.dart';
import 'package:my_app/core/utils/session/session.dart';
import 'package:my_app/generated/di/di.config.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'initGetIt',
  asExtension: false,
)
void configureDependencies() => initGetIt(getIt);

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.addAll([
      // DioCacheManager(CacheConfig()).interceptor,
      AuthInterceptor(getIt<Session>()),
      if (true) LoggerInterceptor(),
    ]);

  @lazySingleton
  @factoryMethod
  RestClient get apiService =>
      RestClient(getIt<Dio>(), baseUrl: APPEndpoints.BASE_URL.content);

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
