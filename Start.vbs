dim Args,progargs
set Args = WScript.Arguments

if(Args.count>0) then
    dim q
    q = chr(34)
    dim i
    for i = 0 to Args.count -1
        progargs = progargs & " " & q & Args.item(i) & q
    next
end if

Dim wsh
Set wsh = WScript.CreateObject("WScript.Shell")
wsh.run("%SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoExit -File D:\XMyPlace\"+ progargs)

