import 'package:flutter_cuidapet/app/core/logger/app_logger.dart';
import 'package:logger/logger.dart';

class AppLoggerImpl implements AppLogger {
  final logger = Logger();
  var messages = <String>[];

  @override
  void debug(message, [error, StackTrace? stackTrace]) =>
      logger.d(message, error, stackTrace);

  @override
  void error(message, [error, StackTrace? stackTrace]) =>
      logger.d(message, error, stackTrace);

  @override
  void info(message, [error, StackTrace? stackTrace]) =>
      logger.d(message, error, stackTrace);

  @override
  void warning(message, [error, StackTrace? stackTrace]) =>
      logger.d(message, error, stackTrace);

  @override
  void append(message) {
    messages.add(message);
  }

  @override
  void closeAppend() {
    info(messages.join('\n'));
  }
}
