
source=WScript.ScriptFullname

i = instrrev(source,"\")

if i > 0 then
	source_dir = left(source,i-1)
else
	source_dir = WScript.CurrentDirectory
end if


q = chr(34)
set Args = WScript.Arguments

prog = "Shell.bat"

if Args.count > 0 then 	
	prog = Args.item(0)
end if

have_args = (Args.count > 1)
if have_args then
    for i = 1 to Args.count -1
        progargs = progargs & " " & q & Args.item(i) & q
    next
end if


launcher = ""
params = ""

if strcomp(".ps1",right(prog,4)) = 0 then
	launcher = q + "%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe" + q
	params = " -NoExit -NoLogo -File"
end if 

Dim wsh
Set wsh = WScript.CreateObject("WScript.Shell")
script = q + source_dir + "\core\sbin\" + prog + q

cmdline = launcher + params + " " + script + progargs
cmdline = ltrim(cmdline)
rem WScript.echo cmdline
wsh.run cmdline
