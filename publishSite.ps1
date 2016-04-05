if($args.length -ne 3) { exit 1} 

$project = $args[0]
$configuration = $args[1]
$profile = $args[2]
$msbuild = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\MSBuild\ToolsVersions\14.0").MSBuildToolsPath+"msbuild.exe"

& "$msbuild" "$project" /p:Configuration="$configuration" /v:n /p:DeployOnBuild=true /p:PublishProfile="$profile"
#msbuild Project.csproj /t:Publish /p:Configuration=Deploy

# $sourceFolder = $args[0]
# $targetFolder = $args[1]

# Write-host "Deploy site ... $sourceFolder"

# Copy-Item $sourceFolder\bin $targetFolder -Recurse -force
# Copy-Item $sourceFolder\content $targetFolder -Recurse -force
# Copy-Item $sourceFolder\scripts $targetFolder -Recurse -force
# Copy-Item $sourceFolder\views $targetFolder -Recurse -force

# Write-host "Deploy site end"