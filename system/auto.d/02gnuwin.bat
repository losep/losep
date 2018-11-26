@echo off
set _GnuWin=%FS_SYSTEM_APP%\shell\gnuwin
if not exist %_GnuWin%\NUL goto end
call mpshell.message Initialize [SYSTEM/GnuWin]
set GnuWin=%_GnuWin%
set NEWPATH=%NEWPATH%;%GnuWin%\sbin;%GnuWin%\bin
set PATH=%NEWPATH%
:end
set _GnuWin=
