
param (
	[switch]$all,
	[String[]] $commands=("which.ps1")
)

function MyPlace-Which([string] $cmd) {
	if(-not $all) {
		Get-Command -TotalCount 1 $cmd 
	}
	else {
		Get-Command $cmd 
	}
}

foreach($cmd in $commands) {
	MyPlace-Which -cmd $cmd -single
}