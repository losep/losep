@ECHO OFF
setlocal

set session_d=%FS_ROOT%\appdata\notepad++\sessions


if "%~1" == "" goto normal

:options
if exist "%session_d%\%~1" goto session

:normal
apprund64 editor\notepad++ notepad++.exe notepad++.exe %*
goto end

:session
set session=%session_d%\%~1
shift
apprund64 editor\notepad++ notepad++.exe notepad++.exe -openSession "%session%" %1 %2 %3 %4 %5 %6 %7 %8 %9

:end
set pgd=
set fsd=
set notepad=
set session_d=
endlocal
