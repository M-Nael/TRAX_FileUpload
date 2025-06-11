if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Clear-Host
$AOSDriveLetter = Read-Host "Please set AOS Service drive letter"

$AOSMetadataPath = $AOSDriveLetter + ":\AOSService\PackagesLocalDirectory"
#Write-Output $AOSMetadataPath

$RepoModelPath = $PSScriptRoot
$RepoModelFolders = Get-ChildItem $RepoModelPath -Directory
foreach ($ModelFolder in $RepoModelFolders)
{
    #Write-Output $ModelFolder
    
    $Target = "$RepoModelPath\$ModelFolder"
	New-Item -ItemType SymbolicLink -Path "$AOSMetadataPath" -Name "$ModelFolder" -Value "$Target"
}

Read-Host -Prompt "Press any key to continue"


