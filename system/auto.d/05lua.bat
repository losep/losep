@echo off
if not exist %FS_SYSTEM_APP%\develop\lua\NUL goto _END
call mpshell.message Initialize [SYSTEM/Lua]
set LUA_DIR=%FS_SYSTEM_APP%\develop\lua\

if not defined NEWPATH goto _PATH
SET NEWPATH=%NEWPATH%;%LUA_DIR%\bin
goto end

:_PATH
SET PATH=%PATH%;%LUA_DIR%\bin
goto end

:_donebefore
:end
:_END