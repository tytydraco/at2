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

# Add the at2 binary to the PATH if it is not already in the PATH
if ! which at2 > /dev/null 2>&1; then
  echo "[!] Add at2 to the PATH:"
  echo "$HOME/.pub-cache/bin"
fi

# Initialize the global at2 directory
if [ ! -d "$HOME/at2" ]; then
    mkdir -p "$HOME/at2"
    mkdir -p "$HOME/at2/.template"

    echo "[*] Copying template directories to global at2 directory..."
    cp -r template/* "$HOME/at2/.template/"

    echo "[*] Global at2 directory initialized:"
    echo "$HOME/at2"
    echo "$HOME/at2/.template"
fi