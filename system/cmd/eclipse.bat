@ECHO OFF

setlocal
set PERL5LIB=D:\myplace\workspace\perl\modules
set PATH=D:\myplace\system\app\develop\ActivePerl\bin\;%PATH%;

apprund + develop\eclipse\eclipse.exe %*

endlocal
