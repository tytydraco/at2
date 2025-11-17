import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/commands/clear.dart';
import 'package:at2/src/commands/clone.dart';
import 'package:at2/src/commands/inject.dart';
import 'package:at2/src/logging.dart';

Future<void> main(List<String> arguments) async {
  /// The main command runner for the application entry point.
  final commandRunner =
      CommandRunner<void>(
          'at2',
          'AutoTriage 2.',
        )
        ..addCommand(InjectCommand())
        ..addCommand(CloneCommand())
        ..addCommand(ClearCommand());

  try {
    await commandRunner.run(arguments);
  } on UsageException catch (e) {
    log(e.message, logLevel: LogLevel.error);
    exit(64);
  } on Exception catch (e) {
    log(e.toString(), logLevel: LogLevel.error);
    exit(1);
  }
}
