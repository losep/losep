@ECHO OFF

if  "" == "%~1" goto USAGE

set input="%~1"

:START
REM echo %output%
REM goto END
set clip=saved

call :sub_ffmpeg -i "%~1" -scodec copy -acodec copy -vcodec copy "%~n1_%clip%%~x1"
goto END

:sub_ffmpeg
echo ffmpeg %* >>save_stream.log
call ffmpeg %*
goto :eof


:Usage
echo %0 v1.0 - make stream of videos
echo.
echo Usage: 
echo.
echo   %0 [input filename]
echo.
echo Copyrighted 2018 eotect@myplace
:END
set input=
set ifn=
set ife=
set clip=


