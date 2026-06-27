@echo off
setlocal

if "%~1"=="" (
    echo Usage: %~nx0 <disque>
    echo Exemple: %~nx0 0
    pause
    exit /b 1
)

set "disque=%~1"

echo Vérification du disque %disque%...
diskpart /s <(echo list disk&echo exit) >nul | findstr /c:"Disque %disque%" >nul
if errorlevel 1 (
    echo Le disque %disque% n'existe pas.
    pause
    exit /b 1
)

echo Sélection et nettoyage du disque %disque%...
diskpart /s <(echo select disk %disque%&echo clean&echo exit) >nul

echo Le disque %disque% a été nettoyé.
pause
endlocal