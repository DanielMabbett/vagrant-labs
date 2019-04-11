<#
.SYNOPSIS
cfg-new-powershelldirectory
.DESCRIPTION
Creates the PowerShell folder in the c drive
.EXAMPLE
None
.NOTES
None
.LINK
None
#>

#SCRIPT VERSION
$sScriptVersion = "0.1"
#LOGGING
$VerbosePreference = 2 ; $InformationPreference = 2 ; $DebugPreference = 2; $sLogPath = "C:\logs" 
If (!(Test-Path -Path $sLogPath)) {New-Item -Path $sLogPath -ItemType Directory}
$sLogName = $MyInvocation.MyCommand.Name  + ".log" ; $sLogFile = Join-Path -Path $sLogPath -ChildPath $sLogName
Function WriteToLog ($Level,$Message){
    if($Level -eq 1){$TimeStamp=Get-date;Write-verbose "$TimeStamp : $Message"}
    if($Level -eq 2){$TimeStamp=Get-date;Write-Debug "$TimeStamp : $Message"}
    if($Level -eq 3){$TimeStamp=Get-date;Write-Information "$TimeStamp : $Message"}
}
#START LOGGING
Start-Transcript "$sLogFile" -Append
#----------------------------[SCRIPT]-----------------------------------------------------------------------# 

$path = "c:\PowerShell"
mkdir $path -force -Verbose 
$tp = Test-Path $path

if ($tp -eq $true){
    Write-host "successful path creation of $path"
}
else {
    Write-host "Unsuccessful path creation of $path"
}

netsh advfirewall set allprofiles state off

#---------------------------[LOGGING FINISH]----------------------------------------------------------------#

#WriteToLog 1 "<Comment for Execution - Verbose outputs>"
#WriteToLog 2 "<Comment for Execution - Debug>"
#WriteToLog 3 "<Comment for Execution - Information>"

#FINISH LOGGING
Stop-Transcript