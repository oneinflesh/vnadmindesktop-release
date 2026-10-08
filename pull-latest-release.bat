@echo off
setlocal

cd /d "%~dp0"
title Vethagama Nanban Office

echo Checking for Vethagama Nanban Office updates...
git -c credential.helper= -c credential.helper=wincred pull --ff-only origin master
if errorlevel 1 (
    echo.
    echo Update failed. Close the desktop application, check your internet connection, and try again.
    pause
    exit /b 1
)

echo.
echo The application is current. Opening now...

if not exist "%~dp0VethagamaNanbanOffice.exe" (
    echo.
    echo VethagamaNanbanOffice.exe is missing. Run this updater again or clone the release repository again.
    pause
    exit /b 1
)

set "VN_LAUNCHER=%~f0"
set "VN_APP=%~dp0VethagamaNanbanOffice.exe"
set "VN_FOLDER=%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$shell = New-Object -ComObject WScript.Shell; $shortcut = $shell.CreateShortcut((Join-Path ([Environment]::GetFolderPath('Desktop')) 'Vethagama Nanban Office.lnk')); $shortcut.TargetPath = $env:VN_LAUNCHER; $shortcut.WorkingDirectory = $env:VN_FOLDER; $shortcut.IconLocation = $env:VN_APP + ',0'; $shortcut.Save()" >nul 2>&1

start "" "%~dp0VethagamaNanbanOffice.exe"
exit /b 0
