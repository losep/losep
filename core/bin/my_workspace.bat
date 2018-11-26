@ECHO OFF

SET DP=d:\System Volume Information\datapool
SET DPTODO=%DP%\todo

CALL cygwin.bat --no-login "%DPTODO%\taskspool" taskspool
CALL cygwin.bat --no-login "%DPTODO%\taskspool\ladies" ladies
REM CALL cygwin.bat --no-login "%DPTODO%\taskspool\ladies\#Reposter" #Reposter
REM CALL cygwin.bat --no-login "%DP%\seeds" seeds
REM CALL cygwin.bat --no-login "F:\files\workspace\afun\boqinews" boqinews
rem CALL cygwin.bat --no-login "%DPTODO%\taskspool\" edit-source

SET DPTODO=




