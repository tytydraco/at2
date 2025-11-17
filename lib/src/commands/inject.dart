import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/logging.dart';
import 'package:path/path.dart' as path;

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

  /// The .riv file path for the working Android project.
  static const rivPathAndroid = 'android/app/src/main/res/raw/input.riv';

  /// The .riv file path for the working iOS project.
  static const rivPathIOS = 'ios/input.riv';

  /// The .riv file path for the working Flutter project.
  static const rivPathFlutter = 'flutter/assets/input.riv';

  @override
  String get name => 'inject';

  @override
  String get description => 'Inject a .riv into the working tree.';

  Future<void> _inject(File input, String destinationPath) async {
    try {
      await input.copy(destinationPath);
    } on Exception catch (_) {
      log(
        'Failed to copy ${input.path} -> $destinationPath',
        logLevel: LogLevel.warn,
      );
    }
  }

  @override
  Future<void> run() async {
    final directoryPath = argResults?['directory'] as String;
    final inputPath = argResults?['input'] as String;

    final directory = Directory(directoryPath);
    final input = File(inputPath);

    // Assert directory exists.
    if (!directory.existsSync()) {
      log('Directory does not exist', logLevel: LogLevel.error);
      exit(1);
    }

    // Assert input exists.
    if (!input.existsSync()) {
      log('Input does not exist', logLevel: LogLevel.error);
      exit(1);
    }

    await _inject(input, path.join(directory.path, rivPathAndroid));
    await _inject(input, path.join(directory.path, rivPathIOS));
    await _inject(input, path.join(directory.path, rivPathFlutter));
  }
}
