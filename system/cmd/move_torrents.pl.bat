@ECHO OFF
echo perl.exe "%PERL_SCRIPT_D%\move_torrents.pl" %1 %2 %3 %4 %5 %6 %7 %8 %9
perl.exe "%PERL_SCRIPT_D%\move_torrents.pl" %*
rem %1 %2 %3 %4 %5 %6 %7 %8 %9
pause
