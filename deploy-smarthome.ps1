$a=`powershell C:\Git\GitDeploy\buildSiteFromGit.ps1 c:\Git\SmartHome "SH.Web\Sh.web.csproj" "SH.Service\SH.Service.csproj"

write-host $a

if($a -eq "Has updates")
{

powershell c:\Git\GitDeploy\deploySite.ps1 C:\Git\SmartHome\SH.Web C:\Sites\monitor.a-d-a.ru

powershell c:\Git\GitDeploy\deployService.ps1 C:\Git\SmartHome\SH.Service\bin\debug C:\Sites\autoupdater.a-d-a.ru\SmartMonitoring.Win

}