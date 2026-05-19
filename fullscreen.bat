@echo off
setlocal

REM ===== App folder =====
set "APPDIR=%~dp0"
set "HTML=%APPDIR%Chromotone_1.1.html"
set "PROFILE=%LOCALAPPDATA%\FASTFAST\ChromoTone\ChromeProfile"

REM ===== Find Chrome =====
set "CHROME=%ProgramFiles%\Google\Chrome\Application\chrome.exe"
if not exist "%CHROME%" set "CHROME=%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe"

if not exist "%CHROME%" (
    echo Google Chrome was not found.
    echo Please install Chrome, then run this again.
    pause
    exit /b 1
)

REM ===== Make profile folder if needed =====
if not exist "%PROFILE%" mkdir "%PROFILE%"

REM ===== Convert Windows path to file:/// URL style =====
set "URLPATH=%HTML:\=/%"

REM ===== Launch ChromoTone =====
start "" "%CHROME%" ^
  --app="file:///%URLPATH%" ^
  --start-fullscreen ^
  --user-data-dir="%PROFILE%" ^
  --disable-extensions ^
  --disable-sync ^
  --disable-background-networking ^
  --no-first-run