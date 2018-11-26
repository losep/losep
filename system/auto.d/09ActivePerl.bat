@echo off
call mpshell.message Initialize [SYSTEM/Active Perl]

SET ACTIVE_PERL_DIR=%FS_SYSTEM_APP%\develop\ActivePerl
set NEWPATH=%NEWPATH%;%ACTIVE_PERL_DIR%\site\bin;%ACTIVE_PERL_DIR%\bin;



