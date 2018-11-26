@ECHO OFF
REM progrun DIRNAME EXENAME
rem progrun download-mspsdk download-mspsdk %1 %2 %3 %4 %5 %6 %7 %8 %9


REM All older PSDK builds share the same location scheme:

    REM http://download.microsoft.com/download/platformsdk/sdk/update/win98mexp/en-us/<build_number>/FULL/PSDK-FULL.<x>.cab

REM where <build_number> may be:

    REM 2601.0 (August 2001 edition)

    REM 3590.2 (November 2001 edition)

    REM 3639.1 (May 2002 edition)

    REM 3663.0 (July 2002 edition)

    REM 3672.1 (August 2002 edition)

    REM 3718.1 (October 2002 edition)

    REM 3790.0 (February 2003 edition)

    REM 2600.2180 (PSDK XP SP2 edition, released in 2003)

REM and <x> is from 1 to (varying) 10, 13, 15, 18 etc. - you will recognize

REM the last cab by its size - all cabs are 25 MB in size, the last one is

REM always smaller.

 

REM You may also download PSDK-FULL.bat and Extract.exe from the same

REM <build_number> location for easy contents extraction.

FOR %%v IN (%*) DO CALL :download_psdk %%v
GOTO END

:download_psdk
	MKDIR %~1
	CD %~1
	CALL :download_file http://download.microsoft.com/download/platformsdk/sdk/update/win98mexp/en-us/%~1/FULL/PSDK-FULL.bat
	CALL :download_file http://download.microsoft.com/download/platformsdk/sdk/update/win98mexp/en-us/%~1/FULL/Extract.exe
	FOR /L %%n IN (1,1,25) DO CALL :download_file http://download.microsoft.com/download/platformsdk/sdk/update/win98mexp/en-us/%~1/FULL/PSDK-FULL.%%n.cab
	CD ..
GOTO :EOF

:download_file
	CALL :downloader "%~1"
GOTO :EOF

:downloader
	echo wget --continue "%~1"
	CALL wget -nc --continue "%~1"
GOTO :EOF

:END

