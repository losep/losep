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

program = "D:\Program Files\够快空间管理器\GoKuai.exe"
'appdata + "\KingSoft\Klive\bin\Klive.exe"
regkey = "HKEY_CURRENT_USER\Software\GoKuai"
datafile = wsh.ExpandEnvironmentStrings("%FS_CORE_DATA%") + "\GoKuai\" + login + ".reg"
wsh.run "xstart.vbs " + q + program + q + " " + q + regkey + q + " " + q + datafile + q, 0, false
