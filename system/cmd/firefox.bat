@ECHO OFF
setlocal

set firefox=%PROGRAMFILES%\Mozilla Firefox\firefox.exe
for %%d in ("%PROGRAMFILES%\Mozilla Firefox\firefox.exe" "%FS_SYSTEM_APP%\firefox\firefox.exe" "%FS_SYSTEM_APP%\internet\firefox\firefox.exe" "%FS_SYSTEM_APP%\internet\Mozilla firefox\firefox.exe") do (
	if exist "%%~d" (set firefox=%%~d&goto profile)
)


:profile
set profile_d=%FS_ROOT%\appdata\firefox\profiles
set profile_n=xiaoranzzz
set args=

:args
if "%1"=="" goto start
if "%1"=="start" goto start
if "%1"=="loader" goto loader
if "%1"=="select" goto select
set profile_n=%1
shift
goto args

:select
shift
echo start "firefox" "%firefox%" -ProfileManager %1 %2 %3 %4 %5 %6 %7 %8 %9 
start "firefox" "%firefox%" -ProfileManager %1 %2 %3 %4 %5 %6 %7 %8 %9 
goto end 

:loader
shift
if "%1"=="" goto lstart
set profile_n=%1
shift
:lstart
shift
echo start "firefox" %FS_APP%\MyPlace\ProgramLoader.exe "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
start "firefox" %FS_APP%\MyPlace\ProgramLoader.exe "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
goto end

:start
shift
echo start "firefox" "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
start "firefox" "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
goto end

:direct
echo "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
"%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
goto end

:end
set firefox=
set profile_d=
set profile_n=
set args=
endlocal
