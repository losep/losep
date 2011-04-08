@ECHO off
REM progrun DIRNAME EXENAME
setlocal
set prog=junction -q
set root=%MyPlace_Files%

if X%root%==X set root=G:\Files
if X%~1==X goto usage
call :create_link %1 %2 %3 %4 %5 %6 %7 %8 %9
goto finished

:create_link
if "%~1"=="" goto :eof
set d=%~1
if not exist "%root%\%d%" goto error
shift
echo Linking from [%d%] ...
if "%~1"=="" goto create_dir
:creating
if "%~1"=="" goto :eof
rem echo creating "%~1", targets "%root%\%d%\%~1" .
if exist "%~n1" %prog% -d "%~1"
%prog% "%~n1" "%root%\%d%\%~1" 
shift
goto creating
:err_c
echo Error, directory exist, "%~1".
shift
goto creating
:create_dir
for /d %%i in ("%root%\%d%\*") do (
    call :creating "%%~ni"
)
goto :eof



:finished
goto end

:error
echo Invalid account %~1.
goto end

:usage
echo %0 (Account Name)
goto end

:end
endlocal


