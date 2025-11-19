import 'package:at2/src/logging.dart';

/// A list of the supported platforms.
enum Platform {
  /// Android.
  android('android'),

  /// iOS.
  ios('ios'),

  /// Flutter.
  flutter('flutter');

  const Platform(this.name);

  /// The name of the platform.
  final String name;
}

/// The help text for the platforms.
const platformHelpText = '''

Specify the platforms to operate on. If no platforms are specified, 
all platforms will be operated on. The platforms are:

Platforms:
  - android
  - ios
  - flutter''';

/// Convert a list of platform names to a list of platforms.
List<Platform> identifiersToPlatforms(List<String> platformNames) {
  // If no platform names are provided, return all platforms.
  if (platformNames.isEmpty) {
    return Platform.values.toList();
  }

  // Otherwise, return the platforms that match the provided platform names.
  return platformNames
      .map(
        (name) {
          final platforms = Platform.values.where(
            (platform) => platform.name.toLowerCase() == name.toLowerCase(),
          );

          // If the platform is not found, log a warning and return null.
          if (platforms.isEmpty) {
            log('Invalid platform name: $name', logLevel: LogLevel.warn);
            return null;
          }

          // Return the first matching platform.
          return platforms.first;
        },
      )
      .whereType<Platform>()
      .toList();
}
