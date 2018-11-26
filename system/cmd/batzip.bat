@ECHO OFF
REM progrun DIRNAME EXENAME
For %2 %%i in (%1) do (
	echo creating archive "%%~i.zip" ...
	zip -Xr0 "%%~i.zip" "%%~i"
	echo   [OK]
	echo.
)