import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/constants.dart';
import 'package:at2/src/logging.dart';
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

  @override
  String get name => 'clone';

  @override
  String get description => 'Clone the template projects to the working tree.';

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

      await _copyDirectory(sourceDir, destDir);
    } on Exception catch (_) {
      log(
        'Failed to clone project from $templatePath to $directoryPath',
        logLevel: LogLevel.warn,
      );
    }
  }

  Future<void> _copyDirectory(Directory source, Directory destination) async {
    await destination.create(recursive: true);

    await for (final entity in source.list()) {
      if (entity is File) {
        final destFile = File(
          path.join(destination.path, path.basename(entity.path)),
        );
        await entity.copy(destFile.path);
      } else if (entity is Directory) {
        final destSubDir = Directory(
          path.join(destination.path, path.basename(entity.path)),
        );
        await _copyDirectory(entity, destSubDir);
      }
    }
  }

  @override
  Future<void> run() async {
    final directoryPath = argResults?['directory'] as String;
    final templatePath = argResults?['template'] as String;

    final directory = Directory(directoryPath);
    final template = Directory(templatePath);

    // Assert directory exists.
    if (!directory.existsSync()) {
      log('Directory does not exist', logLevel: LogLevel.error);
      exit(1);
    }

    // Assert template exists.
    if (!template.existsSync()) {
      log('Template does not exist', logLevel: LogLevel.error);
      exit(1);
    }

    await _clone(template.path, directory.path, androidTemplatePath);
    await _clone(template.path, directory.path, iosTemplatePath);
    await _clone(template.path, directory.path, flutterTemplatePath);
  }
}
