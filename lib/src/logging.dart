import 'dart:io';

/// The log level for [log].
enum LogLevel {
  /// Information that is useful to developers.
  debug,

  /// Normal logging.
  log,

  /// Warnings and concerns.
  warn,

  /// Crashes or errors.
  error,
}

/// Log something to the standard output and standard error.
void log(String content, {LogLevel logLevel = LogLevel.log}) {
  switch (logLevel) {
    case LogLevel.debug: {
      stdout.writeln('\x1B[38;5;244m$content\x1B[0m');
    }
    case LogLevel.log: {
      stdout.writeln(content);
    }
    case LogLevel.warn: {
      stdout.writeln('\x1B[33m$content\x1B[0m');
    }
    case LogLevel.error: {
      stdout.writeln('\x1B[31m$content\x1B[0m');
    }
  }
}
