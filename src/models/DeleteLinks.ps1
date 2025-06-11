if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }
Clear-Host
$AOSDriveLetter = Read-Host "Please set AOS Service drive letter"
$AOSMetadataPath = $AOSDriveLetter + ":\AOSService\PackagesLocalDirectory"

$RepoModelsPath = $PSScriptRoot

$RepoModelFolders = Get-ChildItem $RepoModelsPath -Directory
foreach ($ModelFolder in $RepoModelFolders)
{
	Write-Output "Deleting $AOSMetadataPath\$ModelFolder"
    #Remove-Item -ItemType SymbolicLink -Path "path_to_symbolic_link"
	cmd /c rmdir "$AOSMetadataPath\$ModelFolder"
}

Read-Host -Prompt "Press any key to continue"