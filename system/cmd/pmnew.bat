@ECHO OFF
setlocal
set u_path=%FS_WORKSPACE%\perl\modules
set u_name=%~1
set u_name=%u_name:::=\%
set u_name=%u_name:::=\%
set u_name=%u_name:::=\%
set u_name=%u_name:::=\%
set u_name=%u_name:::=\%
set u_name=%u_name:::=\%
set u_name=%u_name:::=\%
set u_name=%u_name:::=\%

if "%u_name%" == "" goto USAGE

set l_name=%u_name:.pl=%
set l_name=%u_name:.pm=%
set w_name=%u_name%.pm


for %%n in (%u_name% %l_name% %w_name%) do (
	if exist "%u_path%\%%n" (
		call :OPENFILE "%u_path%\%%n"
		goto END
	)
)

call :OPENFILE "%u_path%\%l_name%.pm"

goto end
	

:OPENFILE
echo Open %~1
call np.bat "%~1"
goto :eof


:USAGE
echo Usage:%0 module_name
goto :eof

:END
set u_path=
set u_name=
set l_name=
set w_name=

endlocal