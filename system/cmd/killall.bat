@ECHO OFF

goto running

:exec
echo taskkill.exe /f /im "%~1"
call taskkill.exe /f /im "%~1"
goto :eof

:running
if "%~1" == "" goto END
call :exec "%~1"
shift
goto :running

:END




