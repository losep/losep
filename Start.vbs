
source=WScript.ScriptFullname

i = instrrev(source,"\")

if i > 0 then
	source_dir = left(source,i-1)
else
	source_dir = WScript.CurrentDirectory
end if


q = chr(34)
set Args = WScript.Arguments
have_args = (Args.count > 0)
if have_args then
    for i = 0 to Args.count -1
        progargs = progargs & " " & q & Args.item(i) & q
    next
end if


Dim wsh
Set wsh = WScript.CreateObject("WScript.Shell")

launcher = q + "%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe" + q
script = q + source_dir + "\core\sbin\New-Shell.ps1" + q
params = "-NoLogo -File"

if have_args then
cmdline = launcher + " " + params + " " + script + progargs
else
cmdline = launcher + " -NoExit " + params + " " + script + progargs
end if

if have_args  then
	wsh.run cmdline,0
else
	wsh.run cmdline
end if


