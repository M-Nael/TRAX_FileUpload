$AOSMetadataPath = "C:\AOSService\PackagesLocalDirectory"

$RepoModelsPath = ".\"
$RepoModelFolders = Get-ChildItem $RepoModelsPath -Directory
foreach ($ModelFolder in $RepoModelFolders)
{
	Write-Output "Deleting $AOSMetadataPath\$ModelFolder"
	cmd /c rmdir "$AOSMetadataPath\$ModelFolder"
}

Read-Host -Prompt "Press any key to continue"