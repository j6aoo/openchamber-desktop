#!/bin/bash

APP_NAME="OpenChamber Desktop"
APP_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
APP_EXE="$APP_DIR/bin/neutralino-linux_x64"
ICON_PATH="$APP_DIR/assets/openchamber-logo-dark.png"
DESKTOP_FILE="$HOME/.local/share/applications/openchamber-desktop.desktop"
BIN_LINK="$HOME/.local/bin/openchamber-desktop"

echo "Installing $APP_NAME..."

# Create .desktop entry
cat <<EOF > "$DESKTOP_FILE"
[Desktop Entry]
Name=$APP_NAME
Exec=$APP_EXE
Icon=$ICON_PATH
Type=Application
Categories=Development;IDE;
Terminal=false
Comment=OpenChamber Desktop Launcher (Unofficial)
EOF

chmod +x "$DESKTOP_FILE"
echo "Created desktop entry at $DESKTOP_FILE"

# Create bin symlink
mkdir -p "$HOME/.local/bin"
ln -sf "$APP_EXE" "$BIN_LINK"
echo "Created symlink at $BIN_LINK"

# Update desktop database
update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true

echo "$APP_NAME installed successfully!"
