@ECHO OFF
echo [Android] Initialize SDK
set AndroidSDKDir=%FS_SYSTEM_APP%\mobile\android sdk
set PATH=%AndroidSDKDir%\tools;%AndroidSDKDir%\platform-tools;%PATH%
if "" == "%~1" goto init_end
if "--new" == "%~1" (
	set and_new_cmd=1
	shift
)
if not "" == "%~1" (
	echo [Android] Change directory to "%~1"
	cd /d "%~1"
)
goto init_end

:init_end
echo [Android] Initialized
if "" == "%and_new_cmd%" goto end
set and_new_cmd=
echo [Android] Start new cmd process
cmd.exe
echo [Android] Process end
:end
