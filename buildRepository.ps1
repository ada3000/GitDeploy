$folder = $args[0]
$solution = $args[1]
$msbuild = (Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\MSBuild\ToolsVersions\4.0").MSBuildToolsPath+"msbuild.exe"

#cd $folder

& "$msbuild" "$solution"

#cd ..
