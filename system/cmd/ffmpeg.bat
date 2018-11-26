@echo off
setlocal
set PATH=%PATH%;%FS_SYSTEM_APP%\multimedia\MPlayer;%FS_SYSTEM_APP%\multimedia\MPlayer\codecs
echo ffmpeg.exe %*
ffmpeg.exe %*
endlocal


