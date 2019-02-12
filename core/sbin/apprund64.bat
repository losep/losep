@ECHO %DEBUG% OFF
setlocal
if NOT "%DEBUG%"=="" @ECHO ON
if "%~1"=="" GOTO USAGE

REM IF "AMD64" == "%PROCESSOR_ARCHITEW6432%" goto archit64
IF "AMD64" == "%PROCESSOR_ARCHITECTURE%" goto archit64

:archit32
SET APPD1=%FS_SYSTEM%\app32
SET APPD2=%FS_SYSTEM%\app
goto :set_start
:archit64
SET APPD1=%FS_SYSTEM%\app
SET APPD2=%FS_SYSTEM%\app32

:set_start
:progd_start
SET progd=%~1
shift
for %%d in ("%APPD1%\%progd%" "%APPD2%\%progd%") do (
	if exist "%%~d" (SET progd=%%~d&goto progd_end)
)
:progd_end
if "%~1"=="" GOTO progd_run

:APPNAME_start
REM IF "AMD64" == "%PROCESSOR_ARCHITEW6432%" goto APPNAME64
IF "AMD64" == "%PROCESSOR_ARCHITECTURE%" goto APPNAME64
SET APPNAME2=%~1
SET APPNAME1=%~2
if "" == "%~2"  SET APPNAME1=%APPNAME2%
goto APPNAME_end
:APPNAME64
SET APPNAME1=%~1
SET APPNAME2=%~2
if "" == "%~2"  SET APPNAME2=%APPNAME1%
:APPNAME_end
shift
shift
SET APPPATH=%progd%\%APPNAME1%
if not exist "%APPPATH%" SET APPPATH=%progd%\%APPNAME2%
if not exist "%APPPATH%" goto error_appnotfound
goto app_run

:progd_run
echo start %progd%
IF "%DEBUG%"=="" start "start" "%progd%"
:goto end

:app_run
SET APPD1=
SET APPD2=
SET APPNAME1=
SET APPNAME2=
SET PROGD=
echo start %APPPATH% %1 %2 %3 %4 %5 %6 %7 %8 %9
IF "%DEBUG%"=="" start "start" "%APPPATH%" %1 %2 %3 %4 %5 %6 %7 %8 %9
:app_end
goto END

:Usage
echo apprund64
echo      - Start program in specified directory
echo  Usage:
echo        apprund64 directory executable_64 executable_32
goto end

:error_appnotfound
echo Error program %APPNAME1% not found

:end
SET APPD1=
SET APPD2=
SET APPNAME1=
SET APPNAME2=
SET APPPATH=
endlocal

