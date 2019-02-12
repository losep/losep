@echo off
setlocal
title Cygwin Shell 
SET USERNAME=xiaoranzzz
SET USER=xiaoranzzz
SET HOME=%FS_CORE_DATA%\cygwin\xiaoranzzz
SET CHERE_INVOKING=1
SET TTY=start %FS_SYSTEM_APP%\SHELL\CYGWIN\BIN\Mintty.exe -h never
SET SHELLBIN=%FS_SYSTEM_APP%\SHELL\CYGWIN\BIN\SH.EXE
SET ARGS=--login -i	
SET STARTDIR=
SET TITLE=

:check_opt
if "%~1" == "" goto start
if "%~1" == "--no-login" (
	set ARGS=
	shift
	goto check_opt
)
if "%~1" == "--no-tty" (
	SET TTY=%FS_SYSTEM_APP%\SHELL\CYGWIN\BIN\SH.EXE
	SET NO_TTY=1
	shift
	goto check_opt
) 
if "%STARTDIR%" == "" (
	SET STARTDIR=%~1
	shift
	goto check_opt
)
if "%TITLE%" == "" (
	SET TITLE=%~1
	shift
	goto check_opt
)
SET ARG2=%ARG2% "%~1"
shift
goto check_opt

:start
if "%TITLE%" == "" (
	SET TITLE=Cygwin Shell
)
if not "%STARTDIR%" == "" (
	echo CD /d "%STARTDIR%"
	cd /d "%STARTDIR%"
)
REM echo %TTY% --title "%TITLE%" "%SHELLBIN%" %ARGS% %ARG2% 
IF "%NO_TTY%" == "" GOTO WITH_TTY
:NO_TTY
"%SHELLBIN%" %ARGS% %ARG2%

GOTO END
:WITH_TTY
%TTY% --title "%TITLE%" "%SHELLBIN%" %ARGS% %ARG2%

:END
set TTY=
set ARGS=
set ARG2=
set STARTDIR=
SET TITLE=
SET NO_TTY=
endlocal
