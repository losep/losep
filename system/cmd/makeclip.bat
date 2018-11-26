@ECHO OFF

if  "" == "%~4" goto USAGE

if "%~1" == "mp4" (
	set output=mp4
	shift
)

set input=%~1
set ifn=%~n1
set ife=%~x1

set clip=%~2
set st=%~3
set dt=%~4

shift
shift
shift
shift

if "%ife%" == ".rmvb" set output=mp4
if "%~1" == "" goto START
if "%~1" == "mp4" (
	set output=mp4
	shift
)

:START
REM echo %output%
REM goto END
if "%clip%" == "" set clip=cuts

if "%output%" == "mp4" (
	call :sub_ffmpeg -i "%input%" -ss "%st%" -t "%dt%" -acodec ac3 -vcodec h264 "%ifn%_%clip%.mp4"
) else (
	call :sub_ffmpeg -i "%input%" -ss "%st%" -t "%dt%" -scodec copy -acodec copy -vcodec copy "%ifn%_%clip%%ife%"
)
goto END

:sub_ffmpeg
echo ffmpeg %* >>makeclip.log
call ffmpeg %*
goto :eof


:Usage
echo %0 v1.0 - make clip of movie
echo.
echo Usage: 
echo.
echo   %0 [input filename] [clip name] [start time offset] [duration time] 
echo.
echo Copyrighted 2014 eotect@myplace
:END
set ifn=
set ife=

