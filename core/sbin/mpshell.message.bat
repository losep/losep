@echo off
set msg_p=MyPlace Shell
set msg_t=0
set msg_s=
:getopt
if "%~1"=="" goto usage
if /i "%~1"=="-h" (
	goto usage
)
if /i "%~1"=="-p" (
	set msg_p=%~2
	goto nextopt
)
if /i "%~1"=="-t" (
	set msg_t=%~2
	goto nextopt
)
goto run
:nextopt
shift
shift
goto getopt

:usage
echo %0 [-t INDENTS] [-h] [-p PROMOTES] TEXTS
echo 
goto end

:run
if "%msg_t%"=="1" set msg_s=  
if "%msg_t%"=="2" set msg_s=    
if "%msg_t%"=="3" set msg_s=      
if "%msg_t%"=="4" set msg_s=        
if "%msg_t%"=="5" set msg_s=          
if "%msg_t%"=="6" set msg_s=            
if "%msg_t%"=="7" set msg_s=              
if "%msg_t%"=="8" set msg_s=                
if "%msg_t%"=="9" set msg_s=                  
echo [%msg_p%]%msg_s% %1 %2 %3 %4 %5 %6 %7 %8 %9
goto end

:end
set msg_p=
set msg_t=
set msg_s=