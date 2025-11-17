import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/logging.dart';

/// The inject command.
class InjectCommand extends Command<void> {
  /// Creates a new [InjectCommand].
  InjectCommand() {
    argParser
      ..addOption(
        'directory',
        abbr: 'd',
        help: 'The working tree.',
        defaultsTo: 'working',
      )
      ..addOption(
        'input',
        abbr: 'i',
        help: 'The .riv file to inject.',
        defaultsTo: 'input.riv',
      );
  }

  @override
  String get name => 'inject';

  @override
  String get description => 'Inject a .riv into the working tree.';

  @override
  Future<void> run() async {
    final directory = argResults?['directory'] as String?;
    final input = argResults?['input'] as String?;

    // Use the directory option
    if (directory != null) {
      log('Injecting $input into directory: $directory');
      // TODO(tytydraco): IMPLEMENT INJECT FUNCTIONALITY
    } else {
      log(argParser.usage);
      exit(64);
    }
  }
}
