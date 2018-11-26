@echo off
if not exist %FS_APP%\develop\Chameleon\NUL goto _END
call mpshell.message Initialize [SYSTEM/Chameleon BASIC]
SET Chameleon=%FS_APP%\develop\Chameleon
set NEWPATH=%NEWPATH%;%Chameleon%\Bin

:_END
set Chameleon=