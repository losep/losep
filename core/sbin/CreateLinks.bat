@echo off
setlocal
set starter=call
set src=%~dp0
set files=*

if NOT "%~1" == "" (
	set src=%~1
)

if NOT "%~2" == "" (
	set files=%~2	
)

goto init
goto end

:exec
echo %starter% %1 %2 %3 %4 %5 %6 %7 %8 %9
%starter% %1 %2 %3 %4 %5 %6 %7 %8 %9
goto :eof

:init

for %%f in (%src%\%files%) do (
		call :exec mklink "%%~nxf" "%%~f"
)
for /D %%f in (%src%\%files%) do (
		call :exec mklink /D "%%~nxf" "%%~f"
)
:end
endlocal

