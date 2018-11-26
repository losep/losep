@echo off
set HOME=%HOMEDRIVE%%HOMEPATH%
rem echo %HOME%
start "vim" "%FS_SYSTEM_APP%\editor\vim\vim73\vim.exe" %*
