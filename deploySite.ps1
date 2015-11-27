if($args.length -ne 2) { exit 1} 

$sourceFolder = $args[0]
$targetFolder = $args[1]

Write-host "Deploy site ... $sourceFolder"

Copy-Item $sourceFolder\bin $targetFolder -Recurse -force
Copy-Item $sourceFolder\content $targetFolder -Recurse -force
Copy-Item $sourceFolder\scripts $targetFolder -Recurse -force
Copy-Item $sourceFolder\views $targetFolder -Recurse -force

Write-host "Deploy site end"