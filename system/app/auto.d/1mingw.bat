@echo off
if not exist %FS_System_App%\develop\mingw\setenv.bat goto _END
call mpshell.message Initialize [SYSTEM/MinGW]
call %FS_System_App%\develop\mingw\setenv.bat
:_END
