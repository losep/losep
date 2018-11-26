@ECHO OFF
REM cscript /nologo "%~dp0\mp_pack.vbs" %*
REM goto end
setlocal
if "%~1" == "" goto usage
set dname=%~1
if not exist "%dname%" goto error_dir
set oname=%dname:\=.%
echo creating %oname% from %dname%

set suf=%DATE:~0,10%
set suf=%suf:/=%
set tt=%TIME:~0,5%
set tt=%tt: =0%
set tt=%tt::=%
set suf=%suf%%tt%
set ext=.rar
if exist "%dname%\MYPLACE.PACK.BAT" (
	set archiver="%dname%\MYPLACE.PACK.BAT"
) else (
	set archiver=7z a -scsUTF-8 -mx=9 -r
	set ext=.7z
	set tester=7z t
)
call %archiver% "%oname%_%suf%%ext%" "%dname%"
echo.
echo Directory: %dname%
echo Archived:  %oname%_%suf%%ext%
REM call %tester% "%oname%_%suf%%ext%"
goto END

:usage
echo Usage: %0 directory
goto end

:error_dir
echo Target not exist
goto end

:end
set dname=
set oname=
set ext=
set suf=
set tt=
set archiver=
endlocal
