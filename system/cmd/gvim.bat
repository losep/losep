@echo off
set HOME=%HOMEDRIVE%%HOMEPATH%
rem echo %HOME%
start "gvim" "%FS_SYSTEM_APP%\editor\vim\vim73\gvim.exe" %*
