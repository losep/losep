<#
 .SYNOPSIS
  	Cygwin launcher
	
 .DESCRIPTION
 	A simple launcher for cygwin
	
 .Example
 	cygwin.ps1 
 .Example
 	cygwin.ps1 -user user -home /temp
#>

Param (
	[Alias('u','user')] [Parameter(Position=1)] [String] 
		$username = "xiaoranzzz",
	[Alias('s','sh')] [Parameter(Position=2)] [String] 
		$shell = ($Env:MyPlace_System + "\Cygwin\Bin\SH.EXE"),
	[Alias('h','home')] [Parameter(Position=3)] [String] 
		$userhome = ($Env:MyPlace_Core_Data + "\Linux\$username"),
	[Alias('a','args')] [Parameter(Position=0)] [String[]] 
		$arguments = ("--login","-i")
)


<#
foreach ($arg in ($psboundparameters).keys) {
    	Write-Output ($arg + " = " + ($psboundparameters)[$arg])
}
"Username `t= $username"
"Home `t`t= $userhome"
"Shell `t`t= $shell"
"Arguments `t= $arguments"
#>


$Env:USERNAME = $username
$Env:USER = $Env:USERNAME
$Env:HOME = $userhome

$Cygwin = @{
	"ROOT" = $MyPlace['Env']['SYSTEM'] + "\Cygwin"
}

function Cygwin-Init {
	if($Cygwin["Saved Path"]) {
		$Env:Path = $Cygwin["Saved Path"];
	}
	else {
		$Cygwin["Saved Path"] = $Env:Path
	}
	foreach($p in @("usr\local\bin","usr\bin","bin")) {
		$Env:Path = $Env:Path + ";" + $Cygwin["ROOT"] + "\" + $p
	}
}
function Cygwin-Remove {
	if($Cygwin["Saved Path"]) {
		$Env:Path = $Cygwin["Saved Path"];
	}
}
Cygwin-Init