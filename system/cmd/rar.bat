@ECHO OFF



call cmdrun.bat archiver\Winrar\rar.exe %*
goto :eof
goto END

Command line syntax
--------------------------------------------------------------------------------


It is possible to perform WinRAR commands from the command line. Common command line syntax is described below:

WinRAR <command> -<switch1> -<switchN> <archive> <files...> <@listfiles...> <path_to_extract\> 


Command Character combination denoted function to be performed by WinRAR 
Switch Switches used to define a specific type of operation, compression strength, type of archive, etc. 
Archive The name of the archive to process. 
Files The name(s) of files to be processed. 
Listfiles Listfiles are plain text files that contain names of files to process. File names should start at the first column. It is possible to put comments to the listfile after // characters. For example, you may create backup.lst containing the following strings: 
c:\work\doc\*.txt//backup text documents

c:\work\image\*.bmp//backup pictures

c:\work\misc

and then run:

winrar a backup @backup.lst

You may specify both usual file names and list files in the same command line.
 
Path_to_extract Used only with commands e and x, indicating the folder in which to place extracted files. If this folder does not exist, it will be created. 


Notes

a) If neither files nor listfiles are specified, then *.* is implied and WinRAR will process all files;

b) If archive extension is not specified, WinRAR will use the default archive format selected in the default compression profile, but you may override it specifying either .RAR or .ZIP extension;

c) Switches entered on the command line override the same configuration settings;

d) For commands c, e, s, t, rr, k and x wildcards may be used in the archive name. Thus it is possible to process more than one archive with a single command. Moreover, if you specify -r switch with these commands, they will search for archives in subfolders;

e) Some commands and switches are applicable only to RAR archives, some both to RAR and ZIP and some to all archive formats. This is dependent upon the functionality provided by the archive format;

f) Commands and switches are not case sensitive, you may write them both in upper and in lower case.


Alphabetic commands list
--------------------------------------------------------------------------------

a add files to an archive 
c add an archive comment 
ch change archive parameters 
cv convert archives 
cw write an archive comment to file 
d delete files from an archive 
e extract files from an archive, ignoring paths 
f freshen files within an archive 
i find string in archives 
k lock an archive 
m move files and folders to an archive 
r repair a damaged archive 
rc reconstruct missing volumes 
rn rename archived files 
rr[N] add data recovery record 
rv[N] create recovery volumes 
s[name] convert an archive to a self-extracting type 
s- remove SFX module 
t test archive files 
u update files within an archive 
x extract files from an archive with full paths 


Alphabetic switches list
-------------------------------------------------------------------------------
-ac clear Archive attribute after compression or extraction 
-ad append archive name to destination path 
-af<type> specify archive format 
-ag[format] generate archive name using the current date and time 
-ai ignore file attributes 
-ao add files with Archive attribute set 
-ap<path> set path inside archive 
-as synchronize archive contents 
-av apply authenticity verification 
-av- disable adding authenticity verification 
-cfg- ignore default profile and environment variable 
-cl convert file names to lower case 
-cp<name> select a compression profile 
-cu convert file names to upper case 
-df delete files after archiving 
-dh open shared files 
-dr delete files to Recycle Bin 
-ds do not sort archiving files 
-dw wipe files after archiving 
-ed do not add empty folders 
-en do not add "end of archive" block 
-ep exclude paths from names 
-ep1 exclude base folder from names 
-ep2 expand paths to full 
-ep3 expand paths to full including the drive letter 
-e[+]<attr>  set file exclude or include attributes 
-f freshen files 
-hp[pwd] encrypt both file data and headers 
-iadm request administrative access for SFX archive 
-ibck run WinRAR in background 
-ieml[.][addr] send archive by email 
-iicon<name>  specify SFX icon 
-iimg<name>  specify SFX logo 
-ilog[name] log errors to file 
-inul disable error messages 
-ioff turn PC off 
-k lock archive 
-kb keep broken extracted files 
-m<n> set compression method 
-mc<par> set advanced compression parameters 
-md<n> select dictionary size 
-ms[list] specify file types to store 
-mt<threads>  set the number of threads 
-n<file> include only the specified file 
-n@<listfile> include files listed in the specified list file 
-oc set NTFS "Compressed" attribute 
-or rename files automatically 
-os save NTFS streams 
-ow process file security information 
-o[+|-] set the overwrite mode 
-p[pwd] set password 
-r recurse subfolders 
-r- disable recursion 
-r0 recurse subfolders for wildcard names only 
-ri set priority and sleep time 
-rr[N] add data recovery record 
-rv[N] create recovery volumes 
-s create a solid archive 
-s<N> create solid groups using file count 
-sc<charset>[objects] specify the character set 
-se create solid groups using file extension 
-sfx[name] create self-extracting archive 
-sl<size> process files with size less than specified 
-sm<size> process files with size more than specified 
-sv create independent solid volumes 
-sv- create dependent solid volumes 
-s- disable solid archiving 
-t test files after archiving 
-ta<date> process files modified after the specified date 
-tb<date> process files modified before the specified date 
-tk keep original archive time 
-tl set archive time to newest file 
-tn<time> process files newer than the specified time 
-to<time> process files older than the specified time 
-ts<m,c,a> save or restore file time (modification, creation, access) 
-u update files 
-v<n>[k|b|f|m|M|g|G]  create volumes 
-vd erase disk contents before creating volume 
-ver[n] file version control 
-vn use the old style volume naming scheme 
-vp pause before each volume 
-x<file> exclude the specified file 
-x@<listfile>  exclude files listed in the specified list file 
-y assume Yes on all queries 
-z<file> read archive comment from file 
-- stop switches scanning 

:END
endlocal