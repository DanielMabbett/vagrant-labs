<#
.SYNOPSIS
cfg-download-wmf5
.DESCRIPTION
Downloads the WMF 5 to the c:\drive
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

$url = "http://download.microsoft.com/download/2/C/6/2C6E1B4A-EBE5-48A6-B225-2D2058A9CEFB/Win8.1AndW2K12R2-KB3134758-x64.msu" 
$path = "C:\content\Win8.1AndW2K12R2-KB3134758-x64.msu" 

if ($(Test-Path C:\Content) -eq $false){
    mkdir c:content -verbose -force
} 
else {
    WriteToLog 1 "c:\Content exists. Moving on..."
}

if(!(Split-Path -parent $path) -or !(Test-Path -pathType Container (Split-Path -parent $path))) { 
  $path = Join-Path $pwd (Split-Path -leaf $path) 
}
 
WriteToLog 1 "Downloading [$url]`nSaving at [$path]" 
$client = new-object System.Net.WebClient 
$client.DownloadFile($url, $path) 
#$client.DownloadData($url, $path) 
  
Test-Path $path

#---------------------------[LOGGING FINISH]----------------------------------------------------------------#

#WriteToLog 1 "<Comment for Execution - Verbose outputs>"
#WriteToLog 2 "<Comment for Execution - Debug>"
#WriteToLog 3 "<Comment for Execution - Information>"

#FINISH LOGGING
Stop-Transcript