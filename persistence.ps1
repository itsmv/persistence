# Get the current time and add 1 minute
$startTime = (Get-Date).AddMinutes(1).ToString("HH:mm")

# Path to your PowerShell script
$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "beep.ps1"

# Schedule the PowerShell script using schtasks
schtasks /create /sc HOURLY /tn "MyTasks\BeepTask" /tr "PowerShell.exe -File \"$scriptPath\"" /st $startTime
