import 'dart:convert';
import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';
import 'package:my_app/core/utils/helpers/logger_helper/log_level.dart';

@lazySingleton
class LoggerHelper {
  const LoggerHelper();

  void info(message) {
    _log(LogLevel.info, message);
  }

  void debug(message) {
    _log(LogLevel.debug, message);
  }

  void warning(message) {
    _log(LogLevel.warning, message);
  }

  void error(message) {
    _log(LogLevel.error, message);
  }

  void _log(LogLevel logLevel, message) {
    _stringifyMessage(message).split('\n').forEach(
        (String element) => developer.log(element, name: logLevel.name));
  }

  String _stringifyMessage(message) {
    final finalMessage = message is Function ? message() : message;
    if (finalMessage is Map || finalMessage is Iterable) {
      final JsonEncoder encoder =
          JsonEncoder.withIndent('  ', (object) => object.toString());
      return encoder.convert(finalMessage);
    } else {
      return finalMessage.toString();
    }
  }
}
