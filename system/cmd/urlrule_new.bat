@ECHO OFF
setlocal
set u_path=%FS_WORKSPACE%\perl\urlrule
set u_name=%~1
set u_level=%~2




if "%u_name%" == "" goto USAGE

set l_name=%u_name:*www.=%
set w_name=www.%u_name%



if "%u_level%" == "" (
	for %%n in (%u_name% %l_name% %w_name%) do (
		if exist "%u_path%\0\%%~n" (
			call :OPENFILE "%u_path%\0\%%n"
			goto END
		)
		if exist "%u_path%\common\%%~n" (
			call :OPENFILE "%u_path%\common\%%n"
			goto END
		)
	)
	call :OPENFILE "%u_path%\0\%u_name%"
	goto end
)

for %%n in (%u_name% %l_name% %w_name%) do (
	if exist "%u_path%\%u_level%\%%~n" (
		call :OPENFILE "%u_path%\%u_level%\%%n"
		goto END
	)
)
call :OPENFILE "%u_path%\%u_level%\%u_name%"

goto end
	

:OPENFILE
echo Open %~1
call np.bat "%~1"
goto :eof


:USAGE
echo Usage:%0 rule_name rule_level
goto :eof

:END
set u_path=
set u_name=
set u_level=

endlocal