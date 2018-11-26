@echo off

if "%RUNNER%"=="" set RUNNER=call apprun
if "%KILLER%"=="" set KILLER=taskkill.exe /F /IM


goto MAIN

:EXECUTE
echo %*
%*
goto :EOF


:MAIN
if "%~1"=="" GOTO START
if "%~1"=="stop" GOTO STOP
if "%~1"=="restart" GOTO RESTART
if "%~1"=="start" GOTO START


:START
call :EXECUTE %RUNNER% "%PROGPATH%" %*
goto :EOF
goto END


:STOP
for %%b in (%PROGEXE%) do call :EXECUTE %KILLER% "%%~b"
goto :EOF
goto END


:RESTART
call :STOP
call :START
goto :EOF
goto END

:END