$girRepoPath = $args[0]
$siteProjectpath = $args[1]
$serviceProjectpath = $args[2]

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

    Write-host "Build site ... $siteProjectpath"
    & "$directorypath\buildRepository.ps1" "$girRepoPath" "$siteProjectpath"
    Write-host "Build site end"

    Write-host "Build service ... $serviceProjectpath"
    & "$directorypath\buildRepository.ps1" "$girRepoPath" "$serviceProjectpath"
    Write-host "Build service end"

    Write-host "Has updates"
}
else
{
    Write-host "No updates"
}
cd ..