import 'dart:io';

import 'package:at2/src/logging.dart';
import 'package:at2/src/util/copy_directory.dart';
import 'package:at2/src/workspace/home_directory.dart';
import 'package:path/path.dart' as path;

/// Create a new workspace.
Future<void> createWorkspace(String workspaceName) async {
  // Create the workspace directory.
  final homeDirectoryPath = getHomeDirectoryPath();
  final workspacePath = path.join(homeDirectoryPath, workspaceName);

  // If the workspace directory already exists, log a warning and return.
  if (Directory(workspacePath).existsSync()) {
    log('Workspace already exists: $workspacePath', logLevel: LogLevel.warn);
    return;
  }

  // Create the workspace directory.
  await Directory(
    workspacePath,
  ).create(recursive: true);

  if (!Directory(getTemplateDirectoryPath()).existsSync()) {
    log(
      'Template does not exist: ${getTemplateDirectoryPath()}',
      logLevel: LogLevel.error,
    );
    return;
  }

  final workspaceWorkingPath = path.join(workspacePath, 'working');
  final workspaceTemplatePath = path.join(workspacePath, 'template');

  // Clone the global template projects to the workspace template directory.
  await copyDirectory(
    Directory(getTemplateDirectoryPath()),
    Directory(workspaceTemplatePath),
  );

  // Create the workspace working directory.
  await Directory(workspaceWorkingPath).create();

  // Print instructions to change to the workspace directory.
  log('Workspace created at: $workspacePath');
}
