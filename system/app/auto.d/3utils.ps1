<#
 .SYNOPSIS
  	MyPlace_Utils initializer
	
 .DESCRIPTION
 	Initialize environment variables for MyPlace_Utils
 	
#>




$MyPlace_Utils = @{
	"ROOT" = $MyPlace['Env']['SYSTEM_APP'] + "\Utils"
}

function MyPlace_Utils-Init {
	if($MyPlace_Utils["Saved Path"]) {
		$Env:Path = $MyPlace_Utils["Saved Path"];
	}
	else {
		$MyPlace_Utils["Saved Path"] = $Env:Path
	}
	$Env:Path = $MyPlace_Utils["ROOT"] +  ";" + $Env:Path
}
function MyPlace_Utils-Remove {
	if($MyPlace_Utils["Saved Path"]) {
		$Env:Path = $MyPlace_Utils["Saved Path"];
	}
}
MyPlace_Utils-Init