$test="Your branch is behind"
 
cd $args[0]
$a=`git.exe "status"`

$idx = $a[1].IndexOf($test)

if ( $idx -gt -1 )
{
	write-host "true"
}
else
{
	write-host "false"
}
cd ..