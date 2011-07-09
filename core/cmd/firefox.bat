@ECHO OFF
setlocal

set firefox=%FS_SYSTEM_APP%\internet\firefox\firefox.exe
for %%d in ("%FS_SYSTEM_APP%\firefox\firefox.exe" "%FS_SYSTEM_APP%\internet\firefox\firefox.exe" "%PROGRAMFILES%\Mozilla Firefox\firefox.exe" ) do (
	if exist "%%~d" (set firefox=%%~d&goto profile)
)


:profile
set profile_d=%FS_ROOT%\appdata\firefox\profiles
set profile_n=xiaoranzzz
set args=

if "%1"=="" goto start
if "%1"=="loader" goto loader
set profile_n=%1
shift
goto start

:loader
shift
if "%1"=="" goto lstart
set profile_n=%1
shift
:lstart
echo start "firefox" %FS_APP%\MyPlace\ProgramLoader.exe "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
start "firefox" %FS_APP%\MyPlace\ProgramLoader.exe "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
goto end

:start
echo start "firefox" "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
start "firefox" "%firefox%" -profile "%profile_d%\%profile_n%" %1 %2 %3 %4 %args%
goto end

:end
set firefox=
set profile_d=
set profile_n=
set args=
endlocal
