@ECHO OFF
setlocal
IF "" == "%~1" GOTO USAGE
set fn=%~1
set count=%~2
set PROG=call makeclip.bat mp4
IF "" == "%~2"  SET count=0

IF NOT EXIST "%fn%" GOTO ERR_FILE
GOTO TEST%COUNT%
IF ERRORLEVEL  1 GOTO ERR_COUNT

:START
if "0" == "%count%" (
	%PROG% "%fn%" r 00:00 4:00:00
	GOTO END
)
%PROG% "%fn%" cut01 00:00 05:00
if "1" == "%count%" GOTO END
%PROG% "%fn%" cut02 05:00 05:00
if "2" == "%count%" GOTO END
%PROG% "%fn%" cut03 10:00 05:00
if "3" == "%count%" GOTO END
%PROG% "%fn%" cut04 15:00 05:00
if "4" == "%count%" GOTO END
%PROG% "%fn%" cut05 20:00 05:00
if "5" == "%count%" GOTO END
%PROG% "%fn%" cut06 25:00 05:00
if "6" == "%count%" GOTO END
%PROG% "%fn%" cut07 30:00 05:00
if "7" == "%count%" GOTO END
%PROG% "%fn%" cut08 35:00 05:00
if "8" == "%count%" GOTO END
%PROG% "%fn%" cut09 40:00 05:00
if "9" == "%count%" GOTO END
%PROG% "%fn%" cut10 45:00 05:00
if "10" == "%count%" GOTO END
%PROG% "%fn%" cut11 50:00 05:00
if "11" == "%count%" GOTO END
%PROG% "%fn%" cut12 55:00 05:00
if "12" == "%count%" GOTO END
%PROG% "%fn%" cut13 1:00:00 05:00
if "13" == "%count%" GOTO END
%PROG% "%fn%" cut14 1:05:00 05:00
if "14" == "%count%" GOTO END
%PROG% "%fn%" cut15 1:10:00 05:00
if "15" == "%count%" GOTO END
%PROG% "%fn%" cut16 1:15:00 05:00
if "16" == "%count%" GOTO END
%PROG% "%fn%" cut17 1:20:00 05:00
if "17" == "%count%" GOTO END
%PROG% "%fn%" cut18 1:25:00 05:00
if "18" == "%count%" GOTO END
%PROG% "%fn%" cut19 1:30:00 05:00
if "19" == "%count%" GOTO END
%PROG% "%fn%" cut20 1:35:00 05:00
if "20" == "%count%" GOTO END
%PROG% "%fn%" cut21 1:40:00 05:00
if "21" == "%count%" GOTO END
%PROG% "%fn%" cut22 1:45:00 05:00
if "22" == "%count%" GOTO END
%PROG% "%fn%" cut23 1:50:00 05:00
if "23" == "%count%" GOTO END
%PROG% "%fn%" cut24 1:55:00 05:00
if "24" == "%count%" GOTO END
%PROG% "%fn%" cut25 2:00:00 05:00
if "25" == "%count%" GOTO END
%PROG% "%fn%" cut26 2:05:00 05:00
if "26" == "%count%" GOTO END
%PROG% "%fn%" cut27 2:10:00 05:00
if "27" == "%count%" GOTO END
%PROG% "%fn%" cut28 2:15:00 05:00
if "28" == "%count%" GOTO END
%PROG% "%fn%" cut29 2:20:00 05:00
if "29" == "%count%" GOTO END
%PROG% "%fn%" cut30 2:25:00 05:00
if "30" == "%count%" GOTO END
%PROG% "%fn%" cut31 2:30:00 05:00
if "31" == "%count%" GOTO END
%PROG% "%fn%" cut32 2:35:00 05:00
if "32" == "%count%" GOTO END
%PROG% "%fn%" cut33 2:40:00 05:00
if "33" == "%count%" GOTO END
%PROG% "%fn%" cut34 2:45:00 05:00
if "34" == "%count%" GOTO END
%PROG% "%fn%" cut35 2:50:00 05:00
if "35" == "%count%" GOTO END
%PROG% "%fn%" cut36 2:55:00 05:00
if "36" == "%count%" GOTO END
%PROG% "%fn%" cut37 3:00:00 05:00
if "37" == "%count%" GOTO END
%PROG% "%fn%" cut38 3:05:00 05:00
if "38" == "%count%" GOTO END

GOTO END
:TEST0
:TEST1
:TEST2
:TEST3
:TEST4
:TEST5
:TEST6
:TEST7
:TEST8
:TEST9
:TEST10
:TEST11
:TEST12
:TEST13
:TEST14
:TEST15
:TEST16
:TEST17
:TEST18
:TEST19
:TEST20
:TEST21
:TEST22
:TEST23
:TEST24
:TEST25
:TEST26
:TEST27
:TEST28
:TEST29
:TEST30
:TEST31
:TEST32
:TEST33
:TEST34
:TEST35
:TEST36
:TEST37
:TEST38
GOTO START

:ERR_FILE
echo Error File "%fn%" not exist
GOTO END

:ERR_COUNT
echo Error: Invalid argument %COUNT%
goto END

:USAGE
echo %0 video_file count

:END
endlocal
