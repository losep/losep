@ECHO OFF

:APPEND
if "" == "%~1" goto DONE
echo.fuckbaiduyun | dd oflag=append conv=notrunc of="%~1"
shift
goto APPEND

:DONE

