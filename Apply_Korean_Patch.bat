@echo off
setlocal
cd /d "%~dp0"
set "PATCH=DBZ_Shin_Budokai_2_Korean_v0.8.xdelta"
set "OUTPUT=Dragon Ball Z Shin Budokai 2 Korean v0.8.iso"

if not exist xdelta3.exe (
  echo xdelta3.exe is missing.
  echo Extract xdelta3.exe from xdeltaUI into this folder, then run this file again.
  pause
  exit /b 1
)

if not exist "Dragon Ball Z Shin Budokai 2.iso" (
  echo Put the clean source ISO named "Dragon Ball Z Shin Budokai 2.iso" in this folder.
  echo Check README.md for the required SHA-256 hash.
  pause
  exit /b 1
)

xdelta3.exe -d -f -s "Dragon Ball Z Shin Budokai 2.iso" "%PATCH%" "%OUTPUT%"
if errorlevel 1 (
  echo.
  echo Patch failed. Confirm that the source ISO is the exact required version.
  pause
  exit /b 1
)

echo.
echo Patch complete: "%OUTPUT%"
pause
