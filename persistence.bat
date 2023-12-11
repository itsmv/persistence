@echo off
REM Get the directory path of the batch script
set "batchPath=%~dp0"

REM Define the start time in PowerShell format (HH:mm)
set "startTime=%time:~0,2%:%time:~3,2%"

REM Construct the full path to the PowerShell script
set "scriptPath=%batchPath%beep.ps1"

REM Schedule the PowerShell script using schtasks
schtasks /create /sc HOURLY /tn "MyTasks\BeepTask" /tr "PowerShell.exe -File \"%scriptPath%\"" /st %startTime%
