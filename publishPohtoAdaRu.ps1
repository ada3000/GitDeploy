$girRepoPath = "d:\Git\PhotoGallerie" #$args[0]

$invocation = (Get-Variable MyInvocation).Value
$directorypath = Split-Path $invocation.MyCommand.Path

$test="Your branch is behind"
 
cd $girRepoPath

#Write-host $girRepoPath

git.exe fetch origin
$gitStatus=`git.exe "status"

$hasUpdates = $gitStatus[1].IndexOf($test)

#Write-host "HasUpdates: $HasUpdates>-1 ?"

if($hasUpdates -gt -1)
{
	Write-host "Update repository ..."
    & "$directorypath\updateRepository.ps1" "$girRepoPath"
    Write-host "Update repository end"

	Write-host "Publish site ..."	
	& "D:\Git\GitDeploy\publishSite.ps1" "D:\git\PhotoGallerie\PhotoGalerie.csproj" Debug Music
	Write-host "Publish site end"

    Write-host "Has updates"
}
else
{
    Write-host "No updates"
}