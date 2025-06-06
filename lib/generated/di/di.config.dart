// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_app/core/services/fcm_push_notification/fcm_push_notification.dart'
    as _i8;
import 'package:my_app/core/utils/helpers/logger_helper/logger_helper.dart'
    as _i9;
import 'package:my_app/core/utils/helpers/navigator_global_context.dart'
    as _i10;
import 'package:my_app/core/utils/network/rest_client.dart' as _i11;
import 'package:my_app/core/utils/session/my_shared_preferences.dart' as _i13;
import 'package:my_app/core/utils/session/session.dart' as _i14;
import 'package:my_app/core/utils/validators/validators.dart' as _i4;
import 'package:my_app/generated/di/di.dart' as _i15;
import 'package:my_app/pages/main/bottom_bar/bloc/bottom_bar_bloc.dart' as _i5;
import 'package:my_app/pages/main/count/bloc/count_bloc.dart' as _i6;
import 'package:my_app/routes/router.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.AppValidators>(() => _i4.AppValidators());
  gh.factory<_i5.BottomBarBloc>(() => _i5.BottomBarBloc());
  gh.factory<_i6.CountBloc>(() => _i6.CountBloc());
  gh.lazySingleton<_i7.Dio>(() => registerModule.dio);
  gh.singleton<_i8.FCMPushNotification>(_i8.FCMPushNotification());
  gh.lazySingleton<_i9.LoggerHelper>(() => const _i9.LoggerHelper());
  gh.lazySingleton<_i10.NavigatorGlobalContextHelper>(
      () => _i10.NavigatorGlobalContextHelper());
  gh.lazySingleton<_i11.RestClient>(() => registerModule.apiService);
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => registerModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i13.MySharedPreferences>(
      () => _i13.MySharedPreferences(gh<_i12.SharedPreferences>()));
  gh.lazySingleton<_i14.Session>(
      () => _i14.Session(gh<_i13.MySharedPreferences>()));
  return getIt;
}

class _$RegisterModule extends _i15.RegisterModule {}
