$AOSMetadataPath = "C:\AOSService\PackagesLocalDirectory"

$RepoModelPath = ".\"
$RepoModelFolders = Get-ChildItem $RepoModelPath -Directory
foreach ($ModelFolder in $RepoModelFolders)
{
	$Target = "$RepoModelPath\$ModelFolder"
	New-Item -ItemType SymbolicLink -Path "$AOSMetadataPath" -Name "$ModelFolder" -Value "$Target"
}

Read-Host -Prompt "Press any key to continue"