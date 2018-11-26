<#
 .SYNOPSIS
  	GnuWin initializer
	
 .DESCRIPTION
 	Initialize environment variables for GnuWin
 	
#>




$GnuWin = @{
	"ROOT" = $MyPlace['Env']['SYSTEM_APP'] + "\GnuWin"
}

function GnuWin-Init {
	if($GnuWin["Saved Path"]) {
		$Env:Path = $GnuWin["Saved Path"];
	}
	else {
		$GnuWin["Saved Path"] = $Env:Path
	}
	foreach($p in @("bin","sbin")) {
		$Env:Path = $GnuWin["ROOT"] + "\" + $p + ";" + $Env:Path
	}
}
function GnuWin-Remove {
	if($GnuWin["Saved Path"]) {
		$Env:Path = $GnuWin["Saved Path"];
	}
}
GnuWin-Init