@echo on
SETLOCAL
set pvim=%FS_SYSTEM_APP%\editor\vim\vim73
set vim=%pvim%\gvim.exe
if not exist "%vim%" set vim=%pvim%\vim.exe
"%vim%" %*
ENDLOCAL
