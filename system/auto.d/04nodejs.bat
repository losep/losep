@echo off
set NODEJS_VERSION=8.12.0
set NODEJS_ARCHIT=x86
IF "AMD64" == "%PROCESSOR_ARCHITEW6432%" set NODEJS_ARCHIT=x64
SET NODEJS_VAR=%FS_SYSTEM_APP%\develop\nodejs\node-v%NODEJS_VERSION%-win-%NODEJS_ARCHIT%\nodevars.bat
call mpshell.message Initialize [SYSTEM/Nodejs]
if not exist "%NODEJS_VAR%" goto ERROR
call "%NODEJS_VAR%"
set NEWPATH=%PATH%
goto END
:ERROR
call mpshell.message -t 1 Error: Nodejs not installed
:END
set NODEJS_VERSION=
set NODEJS_ARCHIT=
set NODEJS_VAR=


