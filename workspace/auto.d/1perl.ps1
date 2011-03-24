$Env:XR_PERL_MODULE_DIR = $MyPlace['Env']['Workspace'] + '\perl\modules'
#$Env:Path = $MyPlace['Env']['Workspace'] + '\perl;' + $Env:Path
#$Env:nodosfilewarning = "yes"

function global:Run-Perl([string]$filepath, [String[]]$arguments) {
	if(-not $filepath) {
		Write-Error -ErrorAction SilentlyContinue "Nothing to execute."
		return
	}
	elseif(-not (Test-Path $filepath)) {
		$filepath = $MyPlace['Env']['Workspace'] + '\perl' + $filepath 
	}
	"$filepath $arguments"
	& "perl" $filepath $arguments
}