@echo off
if ""=="%~1" goto usage
if exist "%FS_APP%\%~1" goto fs_app
if exist "%FS_System_APP%\%~1" goto fs_sys
if exist "%FS_Core_APP%\%~1" goto fs_core
CALL %*
goto end

:usage
goto end

:fs_app
CALL %FS_APP%\%*
goto end

:fs_sys
CALL %FS_System_APP%\%*
goto end

:fs_core
CALL %FS_Core_APP%\%*
goto end

:end