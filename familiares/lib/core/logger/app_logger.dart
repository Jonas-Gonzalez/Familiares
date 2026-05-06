// lib/core/logger/app_logger.dart
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart, // Originalmente printTime, sustituido por estar anticuado
    ),
    // Solo emite logs en debug. En release, el logger está completamente silenciado.
    level: kDebugMode ? Level.trace : Level.off,
  );

  static void trace(String message) => _logger.t(message);
  static void debug(String message) => _logger.d(message);
  static void info(String message) => _logger.i(message);
  static void warning(String message, [dynamic error]) => _logger.w(message, error: error);
  static void error(String message, [dynamic error, StackTrace? stackTrace]) =>
      _logger.e(message, error: error, stackTrace: stackTrace);
}