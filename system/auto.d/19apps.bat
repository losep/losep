@echo off
set applist=
set applist=utils %applist%
set applist=archiver\7zip %applist%
set applist=archiver\winrar %applist%
set applist=editor\vim\vim73 %applist%

for %%d in ( %applist% ) do call :setup %%d

call :setup develop\git "Git for Windows" "develop\git;develop\git\cmd;develop\git\bin"
call :setup develop\freebasic "Free Basic"


goto END

:setup
set appd=%~1
set appn=%appd%
set app_path=%appd%
if not "%~2"=="" set appn=%~2
if not "%~3"=="" set app_path=%~3
call mpshell.message Initialize [SYSTEM/App] %appn%
if exist %FS_SYSTEM_APP%\%appd%\NUL goto dosetup
call mpshell.message -t 1 App not installed: %appn%
goto :eof
:dosetup
rem call mpshell.message -t 1 OK
set NEWPATH=%NEWPATH%;%FS_SYSTEM_APP%\%app_path%
set PATH=%NEWPATH%
goto :eof

:END
set applist=
set appd=

