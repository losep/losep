dim wsh
Set wsh = WScript.CreateObject("WScript.Shell")
q = chr(34)

function echo (strText) 
    WScript.Echo strText
end function

function run (strCommand) 
'	echo StrCommand
    wsh.Run strCommand, 0 , true
end function

function qq (strText) 
	qq = q + strText + q
end function

set Args = WScript.Arguments


if Args.count < 3 then
    echo "Usage: " + WScript.ScriptName + " <program> <Registry Key> <Data Filename>"
    WScript.Quit 0
end if

program = Args.item(0)
regkey = Args.item(1)
datafile = Args.item(2)

Set fso = WScript.CreateObject("Scripting.FileSystemObject")
if fso.FileExists(datafile) then
	run "regedit.exe /s " + qq(datafile)
end if
WScript.sleep 500
run qq(program)
WScript.sleep 500
run "regedit.exe /e " + qq(datafile) + " " + qq(regkey)

