const { execSync } = require('child_process');
const path = require('path');
const os = require('os');
const fs = require('fs');

const platform = os.platform();
const scriptsDir = __dirname;

console.log(`Detected platform: ${platform}`);

function runScript(scriptName) {
    const scriptPath = path.join(scriptsDir, scriptName);
    console.log(`Running installation script: ${scriptName}`);
    
    try {
        if (platform === 'win32') {
            execSync(`cmd /c "${scriptPath}"`, { stdio: 'inherit' });
        } else {
            // Ensure executable
            fs.chmodSync(scriptPath, '755');
            execSync(`"${scriptPath}"`, { stdio: 'inherit' });
        }
    } catch (error) {
        console.error(`Installation failed: ${error.message}`);
        process.exit(1);
    }
}

switch (platform) {
    case 'win32':
        runScript('windows-install.bat');
        break;
    case 'linux':
        runScript('linux-install.sh');
        break;
    case 'darwin':
        runScript('macos-install.sh');
        break;
    default:
        console.error(`Platform ${platform} is not supported by the automatic installer.`);
        console.log('Please check the scripts/install directory for manual installation instructions.');
        process.exit(1);
}
