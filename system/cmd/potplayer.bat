@ECHO OFF
setlocal
set ARCH=
IF "AMD64" == "%PROCESSOR_ARCHITEW6432%" set ARCH=64
apprund + "multimedia\PotPlayer%ARCH%\PotPlayerMini%ARCH%" %*
set ARCH=
endlocal