@ECHO OFF
setlocal


set notepad=%FS_SYSTEM_APP%\editor\notepad++\notepad++.exe
for %%d in ("%FS_SYSTEM_APP%\notepad++\notepad++.exe" "%FS_SYSTEM_APP%\editor\notepad++\notepad++.exe" "%PROGRAMFILES%\notepad++\notepad++.exe" ) do (
	if exist "%%~d" (set notepad=%%~d)
)

set session_d=%FS_ROOT%\appdata\notepad++\sessions


if "%~1" == "" goto normal

:options
if exist "%session_d%\%~1" goto session

:normal
echo start "notepad++" "%notepad%" %*
start "notepad++" "%notepad%" %*
goto end

:session
set session=%session_d%\%~1
shift
echo start "notepad++" "%notepad%" -openSession "%session%"
start "notepad++" "%notepad%" -openSession "%session%"
if not "%~1" == "" goto options

:end
set notepad=
set session_d=
endlocal
