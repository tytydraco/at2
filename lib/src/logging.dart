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

}
