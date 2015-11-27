Add-Type -assembly "system.io.compression.filesystem"

if($args.length -ne 2) { exit 1} 

$sourceFolder = $args[0]
$targetFolder = $args[1]

Write-host "Deploy service ... $sourceFolder"

$versionFile = $sourceFolder+"\SH.Service.exe"
$packageFile = $targetFolder +"\package.xml"
$targetFile = $targetFolder+"\dist.zip"

If(Test-path $targetFile) {Remove-item $targetFile}
[io.compression.zipfile]::CreateFromDirectory($sourceFolder, $targetFile)

$version=[System.Diagnostics.FileVersionInfo]::GetVersionInfo($versionFile).FileVersion
Write-host "Deploy service version $version"

$packageXml = [xml](Get-Content $packageFile)
$packageXml.package.version = $version
$packageXml.Save($packageFile)

Write-host "Deploy service end "