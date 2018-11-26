@ECHO OFF
echo perl.exe "%PERL_SCRIPT_D%\convert_torrent" %1 %2 %3 %4 %5 %6 %7 %8 %9
perl.exe "%PERL_SCRIPT_D%\convert_torrent" %*
pause
