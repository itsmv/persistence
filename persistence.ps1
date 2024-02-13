# Get the current time and add 1 minute
$startTime = (Get-Date).AddMinutes(2).ToString("HH:mm")

# Path to your PowerShell script
$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "beep.ps1"

# Schedule the PowerShell script using schtasks
schtasks /create /sc MINUTE /mo 1 /tn "MyTasks\BeepTask" /st $startTime /tr "PowerShell.exe -File `"$scriptPath`""
