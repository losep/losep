@ECHO OFF

if  "" == "%~1" goto Usage
goto START

:START
call save_stream.bat "%~1"
shift
if "" == "%~1" goto END
goto START

:Usage
echo %0 v1.0 - make streams of videos
echo.
echo Usage: 
echo.
echo   %0 [input filename]
echo.
echo Copyrighted 2018 eotect@myplace
:END



