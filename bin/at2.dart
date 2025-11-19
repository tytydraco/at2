import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/commands/clear.dart';
import 'package:at2/src/commands/clone.dart';
import 'package:at2/src/commands/inject.dart';
import 'package:at2/src/commands/workspace.dart';
import 'package:at2/src/logging.dart';
import 'package:at2/src/workspace/home_directory.dart';

Future<void> main(List<String> arguments) async {
  /// The main command runner for the application entry point.
  final commandRunner =
      CommandRunner<void>(
          'at2',
          'AutoTriage 2.',
        )
        ..addCommand(InjectCommand())
        ..addCommand(CloneCommand())
        ..addCommand(ClearCommand())
        ..addCommand(WorkspaceCommand());

  // Create the home directory if it does not exist.
  await createHomeDirectory();

  // Create the template directory if it does not exist
  // and create a simple README.md file to alert the user
  // if the template directory is empty.
  await createTemplateDirectory();

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
