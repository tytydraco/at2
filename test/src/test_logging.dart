import 'package:at2/src/logging.dart';
import 'package:test/scaffolding.dart';

Future<void> main() async {
    group('Logging tests', () {
      test('Debug log', () {
        log('test debug', logLevel: LogLevel.debug);
      });

      test('Log log', () {
        log('test log');
      });

      test('Warning log', () {
        log('test warning', logLevel: LogLevel.warn);
      });

      test('Error log', () {
        log('test error', logLevel: LogLevel.error);
      });
    });
}
