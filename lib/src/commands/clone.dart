import 'package:args/command_runner.dart';

/// The clone command.
class CloneCommand extends Command<void> {
  @override
  String get name => 'clone';

  @override
  String get description => 'Clone the template projects to the working tree.';

  @override
  Future<void> run() async {
    // TODO: Implement clone command logic
  }
}

