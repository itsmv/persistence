@echo off

REM Get the directory path of the batch script
set "batchPath=%~dp0"

REM Construct the full path to the PowerShell script
set "scriptPath=%batchPath%beep.ps1"

REM Schedule the PowerShell script using schtasks
schtasks /create /sc DAILY /tn "MyTasks\BeepTask" /tr "PowerShell.exe -File \"%scriptPath%\"" /st 12:18
