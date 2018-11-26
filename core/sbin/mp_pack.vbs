Function ReadAllFromAny(oExec)

     If Not oExec.StdOut.AtEndOfStream Then
          ReadAllFromAny = oExec.StdOut.ReadLine
          Exit Function
     End If

     If Not oExec.StdErr.AtEndOfStream Then
          ReadAllFromAny = oExec.StdErr.ReadLine
          Exit Function
     End If
     
     ReadAllFromAny = -1
End Function

Sub pack_dir(dir) 
	Dim wsh
	Set wsh = WScript.CreateObject("WScript.Shell")
	dim prog
	dim filename
	filename = dir
	filename = replace(filename,"/",".")
	filename = replace(filename,"\",".")
	if left(filename,1) = "." then
		filename = right(filename,len(filename)-1)
	end if
	if right(filename,1) = "." then
		filename = left(filename,len(filename)-1)
	end if
	dir = """" + dir + """"	
	filename = filename + "_" + FormatDateTime(Date()) + FormatDateTime(Time(),4)
	filename = replace(filename,"/","")
	filename = replace(filename,"\","")
	filename = replace(filename,":","")
	filename = """" + filename + ".7z"""
	prog = "7z a -scsUTF-8 -mx=9 -r " + filename + " " + dir
	WScript.Echo "Running " & prog
	dim oe
	Dim input
	dim tryCount
	input = -1
	tryCount = 0
	set oe = wsh.exec(prog)
	Do While True

     
     input = ReadAllFromAny(oe)
     If -1 = input Then
          If tryCount > 10 And oe.Status = 1 Then
               Exit Do
          End If
          tryCount = tryCount + 1
          WScript.Sleep 100
     Else
          WScript.Echo input
          tryCount = 0
     End If
Loop

End Sub


dim Args,prog,progargs
set Args = WScript.Arguments

if(Args.count>0) then
    dim i
    for i = 0 to Args.count -1
		pack_dir(Args.item(i))
    next
else
	WScript.Echo "Usage:Apprun [command]"
end if

