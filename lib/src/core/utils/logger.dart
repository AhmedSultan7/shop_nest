import 'package:logger/logger.dart';

class Log {
  static final _logger = Logger();

  //? Info
  static void i(dynamic message) {
    _logger.i(message);
  }

  //? Warning
  static void w(dynamic message) {
    _logger.w(message);
  }

  //? Error
  static void e(dynamic message) {
    _logger.e(message);
  }

  //? Other Logs
  static void f(dynamic message) {
    _logger.f(message);
  }
}
