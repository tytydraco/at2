import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/logging.dart';
import 'package:at2/src/util/platforms.dart';
import 'package:path/path.dart' as path;

/// The clear command.
class ClearCommand extends Command<void> {
  /// Creates a new [ClearCommand].
  ClearCommand() {
    argParser.addOption(
      'directory',
      abbr: 'd',
      help: 'The working tree.',
      defaultsTo: 'working',
    );
  }

  Future<void> _clear(String directoryPath, String projectPath) async {
    if (!Directory(path.join(directoryPath, projectPath)).existsSync()) {
      log(
        'Working project $projectPath does not exist',
        logLevel: LogLevel.warn,
      );
      return;
    }

    try {
      final directory = Directory(path.join(directoryPath, projectPath));
      await directory.delete(recursive: true);
    } on Exception catch (_) {
      log('Failed to clear project $projectPath', logLevel: LogLevel.warn);
    }
  }

  /// The path to the Android working project.
  static const androidWorkingPath = 'android';

  /// The path to the iOS working project.
  static const iosWorkingPath = 'ios';

  /// The path to the Flutter working project.
  static const flutterWorkingPath = 'flutter';

  /// The path to the Web working project.
  static const webWorkingPath = 'web';

  /// The path to the React working project.
  static const reactWorkingPath = 'react';

  /// The path to the React Native working project.
  static const reactNativeWorkingPath = 'reactnative';

  @override
  String get name => 'clear';

  @override
  String get description => 'Erase the working directories.\n$platformHelpText';

  @override
  Future<void> run() async {
    final platformNames = argResults?.rest ?? [];
    final directoryPath = argResults?['directory'] as String;

    final platforms = identifiersToPlatforms(platformNames);
    final directory = Directory(directoryPath);

    // Assert directory exists.
    if (!directory.existsSync()) {
      log('Directory does not exist: $directoryPath', logLevel: LogLevel.error);
      exit(1);
    }

    if (platforms.contains(Platform.android)) {
      await _clear(directory.path, androidWorkingPath);
    }
    if (platforms.contains(Platform.ios)) {
      await _clear(directory.path, iosWorkingPath);
    }
    if (platforms.contains(Platform.flutter)) {
      await _clear(directory.path, flutterWorkingPath);
    }
    if (platforms.contains(Platform.web)) {
      await _clear(directory.path, webWorkingPath);
    }
    if (platforms.contains(Platform.react)) {
      await _clear(directory.path, reactWorkingPath);
    }
    if (platforms.contains(Platform.reactNative)) {
      await _clear(directory.path, reactNativeWorkingPath);
    }
  }
}
