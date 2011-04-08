@ECHO ON


IF !%1==! GOTO USAGE
IF EXIST %FS_CORE_CMD%\%1.BAT GOTO EDIT

:CREATE
echo Creating %1 ...
echo @ECHO OFF>%FS_CORE_CMD%\%1.bat
echo REM progrun DIRNAME EXENAME>>%FS_CORE_CMD%\%1.BAT
echo progrun %1 %1 %%1 %%2 %%3 %%4 %%5 %%6 %%7 %%8 %%9>>%FS_CORE_CMD%\%1.bat
goto EDIT

:USAGE
echo USAGE:%0 [NAME]
echo   Create %FS_CORE_CMD%\[NAME].BAT or edit it if exists.
goto END

:EDIT

call "%FS_EDITOR%" "%FS_CORE_CMD%\%1.bat"

:END

