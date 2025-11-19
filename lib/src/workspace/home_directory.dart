import 'dart:io';

import 'package:path/path.dart' as path;

/// The name of the global program directory.
const homeDirectoryName = 'at2';

/// The path to the global template directory.
const templateDirectoryName = '.template';

/// Get the path to the home directory.
String getHomeDirectoryPath() {
  // The home directory for Linux, macOS, and Windows.
  final home =
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  // If the home directory is not found, throw an exception.
  if (home == null) {
    throw Exception('Home directory not found');
  }

  return path.join(home, homeDirectoryName);
}

/// Get the path to the global template directory.
String getTemplateDirectoryPath() {
  final homeDirectoryPath = getHomeDirectoryPath();
  return path.join(homeDirectoryPath, templateDirectoryName);
}

/// Create the home directory if it does not exist.
Future<void> createHomeDirectory() async {
  final workspacePath = getHomeDirectoryPath();
  if (Directory(workspacePath).existsSync()) return;
  await Directory(workspacePath).create(recursive: true);
}

/// Create the template directory if it does not exist.
Future<void> createTemplateDirectory() async {
  final templatePath = getTemplateDirectoryPath();
  if (Directory(templatePath).existsSync()) return;
  await Directory(templatePath).create(recursive: true);

  // Create an simple README.md file in the template directory
  // to alert the user that the template directory is empty.
  await File(path.join(templatePath, 'README.md')).create(recursive: true);
  await File(path.join(templatePath, 'README.md')).writeAsString(
    'Populate this directory with your template projects.',
  );
}
