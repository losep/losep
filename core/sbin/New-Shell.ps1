<#
	.SYNOPSIS
		MyPlace Shell Enviroment
	.DESCRIPTION
		A portable shell enviroment initializer. 
	.Parameter MyPlace_Root
		-r/-root 
			Specify root directory.
	.Parameter OPT_WDIR
		-w/-working-dir
			Specify working directory.
	.Parameter OPT_HELP
		-h/-help
			Display help message.
	.Parameter OPT_NO_CMDS
		-n/-no-cmds
			Do not launch any program.
	.Parameter CMDS
		-c/-commands
			Specify commands to launch
#>

Param (
    [alias("r","root")][parameter(Position=1)][String][AllowEmptyString()]$MyPlace_ROOT,
    [alias("w","working-dir")][parameter(Position=2)][String]$OPT_WDIR,
    [alias("h","help")][parameter(Position=3)][switch]$OPT_HELP,
    [alias("n","no-cmds")][parameter(Position=4)][switch]$OPT_NO_CMDS,
    [alias("c","commands")][parameter(Position=0)][String[]]$CMDS
)

$MyPlace = @{
	'AppName' = 'Shell';
	'AppVersion' = '1.1';
	'AppPath' = Get-Item($MyInvocation.MyCommand.Path);
	'AutoInitDir' = 'auto.d';
	'AutoInitFilename' = "init.ps1";
	'Env' = @{};
	'Alias' = @{};
}


$Local:CORE_NAME = '\core'
$Local:COMPONENTS = "core","system","local","workspace","temp",'appdata'
$Local:EXEC_NAMES = "bin","cmd","sbin"
$Local:SUB_COMPS = "app","data"

@"

         ============================================================
         =                                                          =
         =                  MyPlace PowerShell V1.1                 =
         =                                                          =
         =                                               xiaoranzzz =
         =                                                3/17/2011 =
         ============================================================
		 
"@

function path {
	return $Env:Path
}

function MyPlace-Dump-Args {
	foreach ($arg in ($psboundparameters).keys) {
    	Write-Output ($arg + " = " + ($psboundparameters)[$arg])
	}
}

function MyPlace-Message([string]$title,[string[]]$text) {
    #$title = $args[0]
    #$text = $args[1]
    for($i = 2;$i -lt $args.Count;$i++) {
        #$text += " " + $args[$i]
    }
   Write-Output ("[" + $title + "] " + $text)
}



#function MyPlace-Start([String]$FilePath,[String[]]$Arguments) {
#	Invoke-Item $FilePath 
#}

function MyPlace-Set-Env([string]$name,[string]$value) {
	#$env_name = "env:MyPlace_" + $name
	#Set-Item -Path $env_name -Value $value
	$MyPlace['Env'][$name] = $value
	#MyPlace-Message $MyPlace["AppName"] ("Set MyPlace_" + $name + " [ " + (Get-Item -Path $env_name).Value + " ]")
}
function MyPlace-Get-Env([string]$name) {
	return $MyPlace['Env'][$name]
	#$env_name = "env:MyPlace_" + $name
	#return (Get-Item -Path $env_name).Value
}

function MyPlace-Init-Auto([String] $path) {
	if(Test-Path ($path + "\" + $MyPlace["AutoInitFilename"])) {
		MyPlace-Message $MyPlace["AppName"] ("Processing " + $path + "\" + $MyPlace["AutoInitFilename"])
		. ($path + "\" + $MyPlace["AutoInitFilename"])
	}
	if(Test-Path ($path + "\" + $MyPlace["AutoInitDir"])) {
		Get-ChildItem -Path ($path + "\" + $MyPlace["AutoInitDir"]) -Filter '*.ps1' | Sort-Object | ForEach-Object {
			MyPlace-Message $MyPlace["AppName"] ("Processing " + $_.Fullname + " ...")
			. ($_.Fullname)
		}
	}
}

function MyPlace-PostInit-Exec([String] $name, [String] $path) {
	foreach($en in $EXEC_NAMES) {
		$ep = $path + "\" + $en
		$en = $en.ToUpper()
		if(Test-Path $ep) {
			$ep = Get-Item($ep)
			MyPlace-Init-Auto $ep.Fullname
		}
	}
}

function MyPlace-Init-Exec([String] $name, [String] $path) {
	foreach($en in $EXEC_NAMES) {
		$ep = $path + "\" + $en
		$en = $en.ToUpper()
		if(Test-Path $ep) {
			$ep = Get-Item($ep)
			MyPlace-Set-Env ($name + "_" + $en) $ep.Fullname
			$MyPlace['Env']['New_Path'] = $ep.Fullname + ";" + $MyPlace['Env']['New_Path']
			$Env:PATH = $MyPlace['Env']['New_Path'] + $MyPlace['Env']['Old_Path']
		}
	}
}

function MyPlace-PostInit-Component([String] $name, [String] $path) {
	MyPlace-PostInit-Exec $name.ToUpper() $path
	MyPlace-Init-Auto $path
	foreach($sc in $SUB_COMPS) {
		$sn = $sc.ToUpper()
		$sc = $path + "\" + $sc
		if(Test-Path $sc) {
			$sc = Get-Item($sc)
			MyPlace-PostInit-Exec ($name + "_" + $sn) $sc.Fullname
			MyPlace-Init-Auto $sc.Fullname
		}
	}
}
function MyPlace-Init-Component([String] $name, [String] $path) {
	MyPlace-Init-Exec $name.ToUpper() $path
	foreach($sc in $SUB_COMPS) {
		$sn = $sc.ToUpper()
		$sc = $path + "\" + $sc
		if(Test-Path $sc) {
			$sc = Get-Item($sc)
			MyPlace-Set-Env ($name + "_" + $sn) $sc.Fullname
			MyPlace-Init-Exec ($name + "_" + $sn) $sc.Fullname
		}
	}
}


function MyPlace-Edit([string]$filename) {
	if(-not (Test-Path($filename))) {
		Out-File -FilePath $filename -Confirm -InputObject ""
	}
	if($filename -match "\.(cmd|bat|vbs|js|pl|sh)$") {
		MyPlace-Start $MyPlace["Editor"] $filename   
	}
	else {
			MyPlace-Start $filename
	}
}

function PostInit-MyPlace() {
	foreach ($c in $COMPONENTS) {
	    $MyPlace_comp = $MyPlace['ROOT'] + "\" + $c
		$c = $c.ToUpper()
	    if(Test-Path $MyPlace_comp) {
			$MyPlace_comp = Get-Item($MyPlace_comp)
			MyPlace-PostInit-Component $c $MyPlace_comp.Fullname
	    }
	}
}


function Init-MyPlace() {

	$CWD = Get-Location
	$MyPlace_NEW_PATH = ""
	
	<#
	设定 MyPlace_ROOT, 1.参数指定 2.脚本父目录上溯至 $CORE_NAME 3.脚本父目录的父目录
	#>
	if(!$MyPlace_ROOT) {
	    $MyPlace_ROOT = $MyPlace["AppPath"].Directory.Fullname
	    $i = $MyPlace_ROOT.lastIndexOf($CORE_NAME)
	    if($i) {
	        $MyPlace_ROOT = $MyPlace_ROOT.Remove($i);
	    }
	    else {
	        $MyPlace_ROOT = $MyPlace["AppPath"].Directory.Parent.Fullname
	    }
	}
	$MyPlace['ROOT'] = $MyPlace_ROOT
	MyPlace-Message $MyPlace["AppName"] "ROOT in",$MyPlace_ROOT
	MyPlace-Set-Env "ROOT" $MyPlace_ROOT

	foreach ($c in $COMPONENTS) {
	    $MyPlace_comp = $MyPlace_ROOT + "\" + $c
		$c = $c.ToUpper()
	    if(Test-Path $MyPlace_comp) {
			MyPlace-Message $MyPlace["AppName"] "Initializing $c ..."
			$MyPlace_comp = Get-Item($MyPlace_comp)
			MyPlace-Set-Env $c $MyPlace_comp.Fullname
	    }
	    MyPlace-Init-Component $c $MyPlace_comp.Fullname
	}
	[Array]::Reverse([Array] $COMPONENTS)
	foreach ($c in $COMPONENTS) {
		$c = $c.ToUpper()
		foreach($e in ($EXEC_NAMES + $SUB_COMPS)) {
			$e = $e.ToUpper()
			if(-not $MyPlace['Env'][$e]) {
				if($MyPlace['Env'][($c + '_' + $e)]) {
					$MyPlace['Env'][$e] = $MyPlace['Env'][($c + '_' + $e)]
				}
			}
		}
	}
}


if(Test-path 'Env:MyPlace_Old_Path') {
	$Env:Path = $Env:MyPlace_Old_Path
}
Remove-Item -Path 'Env:MyPlace_*'
Remove-Item -Path 'Env:FS_*'
$MyPlace['Env'] = @{}
$MyPlace['Env']['Old_Path'] = $Env:Path

Init-MyPlace

$MyPlace["Editor"] = ($MyPlace['Env']['System_App'] + "\editor\notepad++\notepad++.exe")
$MyPlace['Env']["Editor"] = $MyPlace["Editor"]

PostInit-MyPlace($MyPlace_ROOT)

$MyPlace['Alias']['MyPlace-Start'] = 'Start-Process'

#$MyPlace
$MyPlace['Env'].keys | ForEach-Object {
	Set-Item -Path ('Env:FS_' + $_) -Value $MyPlace['Env'][$_]
	Set-Item -Path ('Env:MyPlace_' + $_) -Value $MyPlace['Env'][$_]
}
$MyPlace['Alias'].keys | ForEach-Object {
	Set-Alias $_ $MyPlace['Alias'][$_]
}


if($OPT_WDIR -and (Test-Path $OPT_WDIR)) {
	Set-Location $OPT_WDIR
}

if($CMDS) {
	MyPlace-Message $MyPlace["AppName"] "Invoke",$CMDS
	& $CMDS
#EXIT
}
#Get-Item -path 'Env:MyPlace_*'
#$Env:Path
<#
:usage
echo Shell v1.0
echo        - xiaoranzzz@gmail.com
echo Usage:
echo    Shell [-r ROOT_DIR] [cmds...]
echo Option:
echo    -h      	Display this texts
echo    -r      	Set shell MyPlace_ROOT directory
echo    -d      	Set shell working directory
echo	-i		Inherit parent MyPlace_ROOT PATH...
echo	-s,--NO_CMDS	Set no cmd mode
pause
goto END


#>
