@echo off
title Icon Updater - by superer325 (Discord: oncefreedomreplies)
cd /d "%~dp0"
where node >/dev/null 2>nul
if errorlevel 1 (
  echo.
  echo  Node.js is not installed.
  echo  Download the LTS version from https://nodejs.org, install it, then run this again.
  echo.
  start "" https://nodejs.org
  pause
  exit /b
)
set OPEN_BROWSER=1
node server.js
pause
