#!/bin/bash

APP_NAME="OpenChamber Desktop"
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
APP_EXE="$APP_DIR/bin/neutralino-mac_universal"

if [ ! -f "$APP_EXE" ]; then
    # Try architecture specific if universal is missing
    if [[ $(uname -m) == 'arm64' ]]; then
        APP_EXE="$APP_DIR/bin/neutralino-mac_arm64"
    else
        APP_EXE="$APP_DIR/bin/neutralino-mac_x64"
    fi
fi

echo "Installing $APP_NAME..."

# For a real .app we would need a proper structure, but for simple integration
# we can create a symlink in the Applications folder or a simple wrapper.
# Here we'll create a symlink in ~/Applications

mkdir -p "$HOME/Applications"
ln -sf "$APP_EXE" "$HOME/Applications/$APP_NAME"

echo "Created symlink in $HOME/Applications/$APP_NAME"
echo "$APP_NAME installed successfully!"
