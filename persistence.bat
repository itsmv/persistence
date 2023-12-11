@echo off

REM Get the directory path of the batch script
set "batchPath=%~dp0"

REM Berechne die Zeit nach 2 Minuten
for /F "tokens=1-2 delims=:" %%a in ("%time%") do (
    set /a "hh=1%%a+100, mm=1%%b+2"
)

REM Stelle sicher, dass führende Nullen für Zeiten unter 10 hinzugefügt werden (z. B. 09)
if %hh% lss 10 set "hh=0%hh:~-2%"
if %mm% lss 10 set "mm=0%mm:~-2%"

REM Konstruiere den vollständigen Pfad zum PowerShell-Skript
set "scriptPath=%batchPath%beep.ps1"

REM Erstelle eine geplante Aufgabe, um das PowerShell-Skript nach 2 Minuten auszuführen
schtasks /create /sc HOURLY /tn "MyTasks\BeepTask" /tr "PowerShell.exe -File \"%scriptPath%\"" /st %hh%:%mm%
