import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/logging.dart';
import 'package:at2/src/util/copy_directory.dart';
import 'package:at2/src/util/platforms.dart';
import 'package:path/path.dart' as path;

/// The clone command.
class CloneCommand extends Command<void> {
  /// Creates a new [CloneCommand].
  CloneCommand() {
    argParser
      ..addOption(
        'directory',
        abbr: 'd',
        help: 'The destination directory.',
        defaultsTo: 'working',
      )
      ..addOption(
        'template',
        abbr: 't',
        help: 'The path to the template projects.',
        defaultsTo: 'template',
      );
  }

  /// The path to the Android template project.
  static const androidTemplatePath = 'android';

  /// The path to the iOS template project.
  static const iosTemplatePath = 'ios';

  /// The path to the Flutter template project.
  static const flutterTemplatePath = 'flutter';

  /// The path to the Web template project.
  static const webTemplatePath = 'web';

  /// The path to the React template project.
  static const reactTemplatePath = 'react';

  @override
  String get name => 'clone';

  @override
  String get description =>
      'Clone the template projects to the working tree.\n$platformHelpText';

  Future<void> _clone(
    String templatePath,
    String directoryPath,
    String projectPath,
  ) async {
    try {
      final sourceDir = Directory(path.join(templatePath, projectPath));
      final destDir = Directory(path.join(directoryPath, projectPath));

      if (!sourceDir.existsSync()) {
        log(
          'Template project $projectPath does not exist',
          logLevel: LogLevel.warn,
        );
        return;
      }

      await copyDirectory(sourceDir, destDir);
    } on Exception catch (_) {
      log(
        'Failed to clone project from $templatePath to $directoryPath',
        logLevel: LogLevel.warn,
      );
    }
  }

  @override
  Future<void> run() async {
    final platformNames = argResults?.rest ?? [];
    final directoryPath = argResults?['directory'] as String;
    final templatePath = argResults?['template'] as String;

    final platforms = identifiersToPlatforms(platformNames);
    final directory = Directory(directoryPath);
    final template = Directory(templatePath);

    // Assert directory exists.
    if (!directory.existsSync()) {
      log('Directory does not exist: $directoryPath', logLevel: LogLevel.error);
      exit(1);
    }

    // Assert template exists.
    if (!template.existsSync()) {
      log('Template does not exist: $templatePath', logLevel: LogLevel.error);
      exit(1);
    }

    if (platforms.contains(Platform.android)) {
      await _clone(template.path, directory.path, androidTemplatePath);
    }
    if (platforms.contains(Platform.ios)) {
      await _clone(template.path, directory.path, iosTemplatePath);
    }
    if (platforms.contains(Platform.flutter)) {
      await _clone(template.path, directory.path, flutterTemplatePath);
    }
    if (platforms.contains(Platform.web)) {
      await _clone(template.path, directory.path, webTemplatePath);
    }
    if (platforms.contains(Platform.react)) {
      await _clone(template.path, directory.path, reactTemplatePath);
    }
  }
}
