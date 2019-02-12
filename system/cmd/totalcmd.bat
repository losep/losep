@echo off
IF "AMD64" == "%PROCESSOR_ARCHITEW6432%" goto apprun64
IF "AMD64" == "%PROCESSOR_ARCHITECTURE%" goto apprun64
start "%FS_SYSTEM_ROOT%\app32\fileman\totalcmd\totalcmd.exe" %*
goto end
:apprun64
apprund + "fileman\totalcmd\totalcmd64.exe" %*
:end
