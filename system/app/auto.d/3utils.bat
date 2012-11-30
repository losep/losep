@echo off
if exist %FS_SYSTEM_APP%\utils\NUL (
	call mpshell.message Initialize [SYSTEM/UTILS]
	SET NEWPATH=%NEWPATH%;%FS_SYSTEM_APP%\utils
)