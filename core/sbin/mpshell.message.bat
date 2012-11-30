@echo off
if /i "%~1"=="-h" (shift&goto usage_s)
if /i "%~1"=="-p" (shift&goto opt_p)
goto no_opt

:usage_s
echo %0 [-h] [-p PROMOTES] texts
echo 
goto end

:opt_p
echo [%1] %2 %3 %4 %5 %6 %7 %8 %9
goto end

:no_opt
echo [SHELL] %*

:end
