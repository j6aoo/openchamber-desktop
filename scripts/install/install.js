#!/usr/bin/env node
const { execSync } = require('child_process');
const os = process.platform;

const scripts = {
  linux: './linux-install.sh',
  darwin: './macos-install.sh',
  win32: './windows-install.bat'
};

const script = scripts[os];
if (!script) {
  console.error('Unsupported OS:', os);
  process.exit(1);
}

try {
  execSync(script, { stdio: 'inherit', cwd: __dirname });
} catch (e) {
  console.error('Installation failed:', e.message);
  process.exit(1);
}
