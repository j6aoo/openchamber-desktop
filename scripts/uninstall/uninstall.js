#!/usr/bin/env node
const { execSync } = require('child_process');
const os = process.platform;

const scripts = {
  linux: './linux-uninstall.sh',
  darwin: './macos-uninstall.sh',
  win32: './windows-uninstall.bat'
};

const script = scripts[os];
if (!script) {
  console.error('Unsupported OS:', os);
  process.exit(1);
}

try {
  // Windows needs cmd.exe to run .bat files
  const command = os === 'win32' ? `cmd /c "${script}"` : script;
  execSync(command, { stdio: 'inherit', cwd: __dirname });
} catch (e) {
  console.error('Uninstallation failed:', e.message);
  process.exit(1);
}
