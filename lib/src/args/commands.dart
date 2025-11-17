/// A list of the program commands we accept.
enum Commands {
  /// Inject a .riv into the working tree.
  inject('inject'),

  /// Clone the template projects to the working tree.
  clone('clone'),

  /// Erase the working directories.
  clear('clear');

  const Commands(this.command);

  /// The argument parser command.
  final String command;
}
