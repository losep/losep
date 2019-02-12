@ECHO OFF
setlocal
set CHERE_INVOKING=1
set "PATH=%FS_SYSTEM_APP%\shell\cygwin\bin;%PATH%"
IF "%1" == "--no-login" GOTO NOLOGIN
start "conemu_cygwin" %ConEmuBaseDirShort%\conemu-cyg-64.exe -new_console:p "%FS_SYSTEM_APP%\shell\cygwin\bin\bash.exe" --login -i -new_console:C:"%FS_SYSTEM_APP%\shell\cygwin\Cygwin.ico"
GOTO END
:NOLOGIN
"%ConEmuBaseDirShort%\conemu-cyg-64.exe" -new_console:p "%FS_SYSTEM_APP%\shell\cygwin\bin\bash.exe" -i -new_console:C:"%FS_SYSTEM_APP%\shell\cygwin\Cygwin.ico"
:END
endlocal
