@ECHO OFF
IF "x%1"=="x" goto NO_ARG

dir %FS_CORE_CMD%\%1*

goto END

:NO_ARG
dir %FS_CORE_CMD%\*

:END


