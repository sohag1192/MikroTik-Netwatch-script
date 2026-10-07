@echo off
setlocal enabledelayedexpansion

:: Change directory to script folder
cd /d "%~dp0"

title GitHub Auto Uploader - MikroTik Netwatch Script

echo ===================================================
echo       GitHub Auto Uploader
echo       Repository: MikroTik-Netwatch-script
echo ===================================================
echo.

:: Show current status
echo Current Git Status:
echo ---------------------------------------------------
git status -s
echo ---------------------------------------------------
echo.

:: Input commit message or use default timestamp
set /p "msg=Enter commit message (Press Enter for Auto timestamp): "

if "%msg%"=="" (
    set "msg=Update: %date% %time%"
)

echo.
echo [1/3] Adding files to Git...
git add .

echo [2/3] Committing changes...
git commit -m "%msg%"

echo [3/3] Pushing to GitHub (origin main)...
git push origin main

if %ERRORLEVEL% equ 0 (
    echo.
    echo ===================================================
    echo   SUCCESS: Changes uploaded to GitHub successfully!
    echo ===================================================
) else (
    echo.
    echo ===================================================
    echo   ERROR: Push failed! Check your internet/login.
    echo ===================================================
)

echo.
pause
