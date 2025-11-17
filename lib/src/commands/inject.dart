import 'package:args/command_runner.dart';

/// The inject command.
class InjectCommand extends Command<void> {
  @override
  String get name => 'inject';

  @override
  String get description => 'Inject a .riv into the working tree.';

  @override
  Future<void> run() async {
    // TODO: Implement inject command logic
  }
}
