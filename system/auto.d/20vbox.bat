@echo off
goto set1
:set1
set vbox=%SYSTEMDRIVE%\Program Files\Oracle\VirtualBox
if exist "%vbox%" goto set3
:set2
set vbox=%FS_SYSTEM_APP%\Virtualization\VirtualBox
if exist "%vbox%" goto set3
goto novbox
:set3
call mpshell.message Initialize [VirtualBox]
call mpshell.message Path : %vbox%
set NEWPATH=%NEWPATH%;%vbox%
goto END

:novbox
call mpshell.message "No Vbox found"

:END
set vbox=