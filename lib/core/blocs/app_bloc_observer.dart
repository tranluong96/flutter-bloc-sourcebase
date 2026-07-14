import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/utils/helpers/logger_helper/logger_helper.dart';
import 'package:my_app/generated/di/di.dart';

/// Quan sát tập trung mọi thay đổi/lỗi của bloc để log qua [LoggerHelper]
/// thay cho `print`. Gắn tại `main` bằng `Bloc.observer = AppBlocObserver()`.
class AppBlocObserver extends BlocObserver {
  LoggerHelper get _logger => getIt<LoggerHelper>();

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _logger.debug('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    _logger.error('${bloc.runtimeType} onError: $error');
    super.onError(bloc, error, stackTrace);
  }
}
