@echo off
SET _ChocolateyInstall=%FS_SYSTEM_APP%\softmgr\chocolatey
if not exist %_ChocolateyInstall%\NUL goto end
call mpshell.message Initialize [SYSTEM/Chocolatey]
set ChocolateyInstall=%_ChocolateyInstall%
set NEWPATH=%NEWPATH%;%ChocolateyInstall%\sbin;%ChocolateyInstall%\bin
set PATH=%NEWPATH%
:end
set _ChocolateyInstall=
