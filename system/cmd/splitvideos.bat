@ECHO OFF
echo Selecting files %~1 [%~2] : 
for %%f in (%~1) do (
	echo ">>>%%~f"
)
for %%f in (%~1) do (
	splitvideo "%%~f" %~2
)

