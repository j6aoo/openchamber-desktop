@echo off
setlocal

set "APP_NAME=OpenChamber Desktop"
set "APP_EXE=%~dp0..\..\bin\neutralino-win_x64.exe"
set "APP_ICON=%~dp0..\..\assets\openchamber-logo-dark.png"

echo Installing %APP_NAME%...

:: Create Start Menu shortcut
set "SHORTCUT_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\%APP_NAME%.lnk"
echo Creating Start Menu shortcut at: %SHORTCUT_PATH%

powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%SHORTCUT_PATH%'); $s.TargetPath = '%APP_EXE%'; $s.WorkingDirectory = '%~dp0..\..'; $s.IconLocation = '%APP_ICON%'; $s.Save()"

:: Create Desktop shortcut (optional)
set /p "INSTALL_DESKTOP=Do you want to create a desktop shortcut? (y/n): "
if /i "%INSTALL_DESKTOP%"=="y" (
    set "DESKTOP_SHORTCUT=%USERPROFILE%\Desktop\%APP_NAME%.lnk"
    echo Creating Desktop shortcut at: %DESKTOP_SHORTCUT%
    powershell -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%DESKTOP_SHORTCUT%'); $s.TargetPath = '%APP_EXE%'; $s.WorkingDirectory = '%~dp0..\..'; $s.IconLocation = '%APP_ICON%'; $s.Save()"
)

echo %APP_NAME% installed successfully!
pause
