dim wsh
Set wsh = WScript.CreateObject("WScript.Shell")
set Args = WScript.Arguments
if Args.count < 1 then
    WScript.echo "Usage: " + WScript.ScriptName + " <Login Name>"
    WScript.Quit 0
end if
login = Args.item(0)

q = chr(34)

appdata = wsh.ExpandEnvironmentStrings("%AppData%")

program = appdata + "\KingSoft\Klive\bin\Klive.exe"
regkey = "HKEY_CURRENT_USER\Software\KLive"
datafile = wsh.ExpandEnvironmentStrings("%FS_CORE_DATA%") + "\Klive\" + login + ".reg"
wsh.run "xstart.vbs " + q + program + q + " " + q + regkey + q + " " + q + datafile + q, 0, false
