import 'package:args/args.dart';
import 'package:at2/src/logging.dart';

ArgParser buildParser() {
  return ArgParser()
    ..addFlag(
      'help',
      abbr: 'h',
      negatable: false,
      help: 'Print this usage information.',
    );
}

void printUsage(ArgParser argParser) {
  log(argParser.usage);
}

void main(List<String> arguments) {
  final argParser = buildParser();
  try {
    final results = argParser.parse(arguments);

    // Show help.
    if (results.flag('help')) {
      printUsage(argParser);
      return;
    }

    log('Positional arguments: ${results.rest}');
  } on FormatException catch (e) {
    log(e.message, logLevel: LogLevel.error);
    log('');
    printUsage(argParser);
  }
}
