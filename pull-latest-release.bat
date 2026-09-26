@echo off
setlocal

cd /d "%~dp0"

echo Updating Vethagama Nanban Office...
git pull --ff-only origin master
if errorlevel 1 (
    echo.
    echo Update failed. Close the desktop application, check your internet connection, and try again.
    pause
    exit /b 1
)

echo.
echo Desktop release updated successfully.
pause
