@ECHO OFF

setlocal
REM progrun DIRNAME EXENAME
set url=http://download.mozilla.org/?product=firefox-4.0&os=win&lang=en-US
wget -L "%url%"

endlocal