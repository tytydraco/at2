#!/usr/bin/env bash

# Ensure dependencies are up to date
dart pub get

# Deactivate existing installation
dart pub global deactivate at2 2>/dev/null || true

# Remove the actual binary script wrapper
rm -f "$HOME/.pub-cache/bin/at2"

# Remove the snapshot file that the wrapper references
# This is in the project's .dart_tool directory
rm -rf .dart_tool/pub/bin/at2

# Remove the package cache
rm -rf "$HOME/.pub-cache/global_packages/at2"

# Activate with path source, forcing overwrite
# This will regenerate the snapshot
dart pub global activate -s path . --overwrite