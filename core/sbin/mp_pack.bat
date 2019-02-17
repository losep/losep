@ECHO OFF
REM cscript /nologo "%~dp0\mp_pack.vbs" %*
REM goto end
setlocal
if "%~1" == "" goto usage
:SUB_PACK
set dname=%~1
shift
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
	call "%dname%\MYPLACE.PACK.BAT"
) else (
	set archiver=7z a -scsUTF-8 -mx=9 -r
	set ext=.7z
	set tester=7z t
)
echo %archiver% "%oname%_%suf%%ext%" "%dname%"
call %archiver% "%oname%_%suf%%ext%" "%dname%"
echo.
echo Directory : %dname%
echo Archived  : %oname%_%suf%%ext%
REM call %tester% "%oname%_%suf%%ext%"
:SUB_PACK_END
if not "%~1" == "" goto SUB_PACK
goto END

:usage
echo Usage: %0 directory
goto end

:error_dir
echo Directory not found: %dname%
goto SUB_PACK_END
goto end

:end
set dname=
set oname=
set ext=
set suf=
set tt=
set archiver=
endlocal
