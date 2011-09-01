@echo %DEBUG% off

goto BEGIN

REM setlocal
REM ��ʼ�������ļ��л����Ķ��ı��ػ���������ִ�� SETLOCAL ֮��
REM �����Ļ����Ķ�ֻ�����������ļ���Ҫ��ԭԭ�ȵ����ã�����ִ
REM �� ENDLOCAL���ﵽ�������ļ���βʱ�����ڸ��������ļ���ÿ��
REM ��δִ�е� SETLOCAL ���������һ�������� ENDLOCAL ��ִ�С�

REM SETLOCAL

REM ���������չ�����ã�SETLOCAL �����¸ı�:

REM SETLOCAL ���������ڿ��Խ��ܿ�ѡ����:
        REM ENABLEEXTENSIONS / DISABLEEXTENSIONS
            REM ���û�������������չ����Щ
            REM ������ CMD /E:ON �� /E:OFF
            REM ����������Ȩ������� CMD /? ��ȡ��ϸ��Ϣ��
        REM ENABLEDELAYEDEXPANSION / DISABLEDELAYEDEXPANSION
            REM ���û�����ӻ���������
            REM ��չ����Щ������ CMD
            REM /V:ON �� /V:OFF ����������Ȩ������� CMD /? ��ȡ��ϸ��Ϣ��
REM ������ SETLOCAL ����֮ǰ���ǵ�������ʲô����Щ�޸Ļ�һֱ
REM ������ƥ��� ENDLOCAL ���

REM �����һ��������
REM SETLOCAL ������� ERRORLEVEL ��ֵ�������������Ч�����е�һ����
REM ��ֵ��Ϊ�㡣
REM �����м��ɣ������������ű���
REM ʹ�������������չ�Ƿ����:

    REM VERIFY OTHER 2>nul
    REM SETLOCAL ENABLEEXTENSIONS
    REM IF ERRORLEVEL 1 echo Unable to enable extensions

REM �������֮������Ч������Ϊ�� CMD.EXE �ľɰ汾�ϣ�SETLOCAL
REM δ���� ERRORLEVEL ֵ�����в���ȷ������ VERIFY ���
REM ERRORLEVEL ֵ��ʼ���ɷ���ֵ��




:FS_INIT
if ""=="%~2" goto :eof
echo [SHELL] Initializing [%2]...
if not exist %FS_ROOT%\%1\NUL goto :eof
call :MY_SET FS_%2 %FS_ROOT%\%1
call :FS_SET %1 %2 cmd CMD
call :FS_SET %1 %2 app APP
call :FS_SET %1 %2 data DATA
for %%i in (sbin bin cmd) do if exist %FS_ROOT%\%1\%%i\NUL set NEWPATH=%FS_ROOT%\%1\%%~ni;!NEWPATH!
if exist %FS_ROOT%\%1\init.bat call %FS_ROOT%\%1\init.bat %*
for /L %%i in (0,1,25) DO (
    for %%j in (%FS_ROOT%\%1\cmd\auto.d\%%i*.bat) DO call "%%~j" 
	for %%j in (%FS_ROOT%\%1\app\auto.d\%%i*.bat) DO call "%%~j" 
)
goto :eof

:MY_SET
set FS_TEMP_STR=%2
set FS_TEMP_STR=%FS_TEMP_STR:\\=\%
set FS_TEMP_STR=%FS_TEMP_STR:\\=\%
set FS_TEMP_STR=%FS_TEMP_STR:\\=\%
set %1=%FS_TEMP_STR%
set FS_TEMP_STR=
goto :eof

:FS_SET
if exist %FS_ROOT%\%1\%3\NUL (
	call :MY_SET FS_%2_%4=%FS_ROOT%\%1\%3
)
goto :eof



:usage
echo Shell v1.0
echo        - xiaoranzzz@gmail.com
echo Usage:
echo    Shell [-r ROOT_DIR] [cmds...]
echo Option:
echo    -h      	Display this texts
echo    -r      	Set shell FS_ROOT directory
echo    -d      	Set shell working directory
echo	-i		Inherit parent FS_ROOT PATH...
echo	-s,--NO_CMDS	Set no cmd mode
pause
goto END


:BEGIN
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION 

title Shell 
SET SHELL_CMD=
SET SHELL_DIR=
SET SHELL_INHERIT_PARENT=
SET SHELL_MODE_NOCMDS=
SET SHELL_D=%~d0
SET SHELL_P=%~p0


:getopt
if "%~1"=="" goto getopt_done
if /I "%~1"=="-h" goto usage
if /I "%~1"=="-i" (set SHELL_INHERIT_PARENT=1&shift&goto getopt)
if /I "%~1"=="-s" (set SHELL_MODE_NOCMDS=1&shift&goto getopt)
if /I "%~1"=="-r" (set SHELL_FS_ROOT=%~2&shift&shift&goto getopt)
if /I "%~1"=="-d" (set SHELL_DIR=%~2&shift&shift&goto getopt)
set SHELL_CMD=%SHELL_CMD% %1
shift
goto getopt
:getopt_done


:SET_S
IF "%SHELL_INHERIT_PARENT%"=="" (set FS_ROOT=&set PATH=)
SET SHELL_INHERIT_PARENT=
IF NOT "%SHELL_FS_ROOT%"=="" set FS_ROOT=%SHELL_FS_ROOT%
SET SHELL_FS_ROOT=

:FSROOT_S
IF NOT "%FS_ROOT%"=="" GOTO FSROOT_E
REM SET FS_ROOT=%SHELL_D%%SHELL_P%
SET FS_ROOT=%~DP0
SET FS_ROOT=%FS_ROOT:\core\sbin\=%
if exist "%FS_ROOT%\core\sbin\Shell.bat" goto FSROOT_E
SET FS_ROOT=%SHELL_D%
if exist "%FS_ROOT%\core\sbin\Shell.bat" goto FSROOT_E
SET FS_ROOT=%SHELL_D%%SHELL_P%
:FSROOT_E
SET SHELL_D=
SET SHELL_P=
call :MY_SET FS_ROOT %FS_ROOT%
echo [SHELL] Root in "%FS_ROOT%"
SET SHELL_OLD_PATH=%PATH%
set NEWPATH=%SYSTEMROOT%\system32
set NEWPATH=%NEWPATH%;%SYSTEMROOT%

call :FS_INIT core CORE
call :FS_INIT system SYSTEM
call :FS_INIT local LOCAL
call :FS_INIT workspace WORKSPACE
call :FS_INIT temp   TEMP
set FS_APP=%FS_SYSTEM_APP%
set FS_CMD=%FS_SYSTEM_CMD%
echo [SHELL] Initialized.

set PATH=%NEWPATH:\\=\%
set NEWPATH=
call PATHADD.BAT "%SHELL_OLD_PATH%"

:PATH_E
REM for %%i in (%PATH%) do echo %%i
REM if exist %FS_Core%\bin\sed.exe echo %PATH% | %FS_CORE%\bin\sed.exe -e "s/;\+/\n/g;s/\\\\/\\/g";
SET SHELL_OLD_PATH=

rem SETX -m PATH "%PATH%"


:CWD_S
REM SET SHELL_PWD=%CD%
if not "%SHELL_DIR%"=="" (echo [SHELL] Working under "%SHELL_DIR%"&CHDIR /D "%SHELL_DIR%")
:CWD_E
set SHELL_DIR=

:CMD_S
if not "%SHELL_MODE_NOCMDS%"=="" goto CMD_E
if "__BYCMD__" == "%SHELL_CMD%" goto CMD_E
if "" == "%SHELL_CMD%" SET SHELL_CMD=cmd.exe
:SHELL_CMD

title "%SHELL_CMD%"
echo [SHELL] %SHELL_CMD%
%SHELL_CMD%

REM    CHDIR /D "%SHELL_PWD%"
:CMD_E
SET SHELL_PWD=
SET SHELL_MODE_NOCMDS=
SET SHELL_CMD=

GOTO END




:END
SET SHELL_INHERIT_PARENT=
endlocal

