<#
.SYNOPSIS
cfg-new-contentdirectory
.DESCRIPTION
Creates the content folder in the c drive
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
Function WriteToLog ($Lv,$Msg){
    if($Lv -eq 1){$Time=Get-date;Write-verbose     "$Time : $Msg"}
    if($Lv -eq 2){$Time=Get-date;Write-Debug       "$Time : $Msg"}
    if($Lv -eq 3){$Time=Get-date;Write-Information "$Time : $Msg"}
}
#START LOGGING
Start-Transcript "$sLogFile" -Append
#----------------------------[SCRIPT]-----------------------------------------------------------------------# 

$path = "c:\Content"
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