import 'dart:io';

import 'package:path/path.dart' as path;

/// Copy a directory from a source to a destination.
Future<void> copyDirectory(Directory source, Directory destination) async {
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
      await copyDirectory(entity, destSubDir);
    }
  }
}
