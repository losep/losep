@ECHO OFF
setlocal
for %%d in ("." "%FS_SYSTEM_CMD%" "%FS_CORE%\cmd" "%FS_CORE%\bin" "%FS_CORE%\sbin" "%FS_SYSTEM%\bin" "%FS_WORKSPACE%\shellscript" "%FS_WORKSPACE%\perl") do (
    echo %%~d\%1 ?
    if not exist "%%~d\%~1\NUL" if exist "%%~d\%~1" call :edit "%%~d\%~1"&goto end
	for %%e in (bat cmd vbs js wsh ps1 sh pl pm) do (
		echo %%~d\%~1.%%e ?
		if not exist "%%~d\%~1.%%e\NUL" if exist "%%~d\%~1.%%e" call :edit "%%~d\%~1.%%e"&goto end
	)
)
echo Command not found: %1
goto end

:edit
echo YES
call "%FS_EDITOR%" "%~1"
goto :eof


:end
endlocal