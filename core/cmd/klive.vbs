dim wsh
Set wsh = WScript.CreateObject("WScript.Shell")

function echo (strText) 
    WScript.Echo strText
end function



set Args = WScript.Arguments


if Args.count < 1 then
    echo "Usage: WScript.ScriptName <Login Name>"
    WScript.Quit 0
end if

login = Args.item(0)



function run (strCommand) 
    rem echo StrCommand
    wsh.Run strCommand, 0 , true
end function

q = chr(34)
Set fso = WScript.CreateObject("Scripting.FileSystemObject")
coredata = wsh.ExpandEnvironmentStrings("%FS_CORE_DATA%")
login_file = coredata + "\Klive\" + login + ".reg"

appdata = wsh.ExpandEnvironmentStrings("%AppData%")
program = appdata + "\KingSoft\Klive\bin\Klive.exe"

run "regedit.exe /s " + q + login_file + q
run program
run "regedit.exe /e " + q + login_file + q + " HKEY_CURRENT_USER\Software\KLive"




