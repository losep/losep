@ECHO OFF
REM progrun DIRNAME EXENAME
start %FS_SYSTEM_APP%\internet\vuze\Azureus.exe -J-Dazureus.config.path="f:\System Volume Information\datapool\bt\vuze\" -J-DMULTI_INSTANCE=true %1 %2 %3 %4 %5 %6 %7 %8 %9

