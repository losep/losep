@ECHO OFF
setlocal
if "%1" == "" goto usage
set dname=%~1
if not exist "%dname%" goto error_dir
set oname=%dname:\=.%
echo creating %oname% from %dname%
set ext=.rar
set suf=%DATE: =_%
if exist "%dname%\MYPLACE.PACK.BAT" (
	set archiver="%dname%\MYPLACE.PACK.BAT"
) else (
	set archiver=rar a
)
call %archiver% "%oname%_%suf%%ext%" "%dname%"
echo done
goto END

:usage
echo %0 <directory>
goto end

:error_dir
echo Target not exist
goto end

:end
set dname=
set oname=
set ext=
endlocal
