import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:at2/src/logging.dart';
import 'package:at2/src/workspace/workspace.dart';

/// The workspace command.
class WorkspaceCommand extends Command<void> {
  @override
  String get name => 'workspace';

  @override
  String get description =>
      'Create a new workspace.\n\nSpecify the workspace name as an argument.';

  Future<void> _workspace(String workspaceName) async {
    try {
      await createWorkspace(workspaceName);
    } on Exception catch (e) {
      log(
        'Failed to create workspace $workspaceName: $e',
        logLevel: LogLevel.warn,
      );
    }
  }

  @override
  Future<void> run() async {
    final workspaceName = argResults?.rest.join(' ');
    if (workspaceName == null) {
      log('No workspace name provided', logLevel: LogLevel.error);
      exit(1);
    }

    await _workspace(workspaceName);
  }
}
