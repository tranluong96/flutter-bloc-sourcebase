// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:my_app/core/services/fcm_push_notification/fcm_push_notification.dart'
    as _i716;
import 'package:my_app/core/utils/helpers/logger_helper/logger_helper.dart'
    as _i732;
import 'package:my_app/core/utils/helpers/navigator_global_context.dart'
    as _i740;
import 'package:my_app/core/utils/network/rest_client.dart' as _i559;
import 'package:my_app/core/utils/session/my_shared_preferences.dart' as _i800;
import 'package:my_app/core/utils/session/session.dart' as _i328;
import 'package:my_app/core/utils/validators/validators.dart' as _i61;
import 'package:my_app/generated/di/di.dart' as _i61;
import 'package:my_app/pages/main/bottom_bar/bloc/bottom_bar_bloc.dart'
    as _i189;
import 'package:my_app/pages/main/count/bloc/count_bloc.dart' as _i361;
import 'package:my_app/routes/router.dart' as _i412;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.factoryAsync<_i460.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.factory<_i189.BottomBarBloc>(() => _i189.BottomBarBloc());
  gh.factory<_i361.CountBloc>(() => _i361.CountBloc());
  gh.singleton<_i716.FCMPushNotification>(() => _i716.FCMPushNotification());
  gh.lazySingleton<_i732.LoggerHelper>(() => const _i732.LoggerHelper());
  gh.lazySingleton<_i740.NavigatorGlobalContextHelper>(
    () => _i740.NavigatorGlobalContextHelper(),
  );
  gh.lazySingleton<_i61.AppValidators>(() => _i61.AppValidators());
  gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i559.RestClient>(() => registerModule.apiService);
  gh.lazySingleton<_i412.AppRouter>(() => _i412.AppRouter());
  gh.lazySingleton<_i800.MySharedPreferences>(
    () => _i800.MySharedPreferences(gh<_i460.SharedPreferences>()),
  );
  gh.lazySingleton<_i328.Session>(
    () => _i328.Session(gh<_i800.MySharedPreferences>()),
  );
  return getIt;
}

class _$RegisterModule extends _i61.RegisterModule {}
