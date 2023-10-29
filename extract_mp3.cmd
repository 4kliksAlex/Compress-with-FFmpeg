@echo off
set ti=%~n0
set mylist=%*
set mytmp=%tmp%\video-%random%
md %mytmp%
setlocal EnableDelayedExpansion
for %%i in (!mylist!) do (
endlocal
title %ti% - %%~nxi
ffmpeg.exe -i "%%~i" -c:v h264_amf -b:v 256k -n "%mytmp%\%%~ni.mp3"
move "%mytmp%\%%~ni.mp3" "%%~dpni.mp3"
setlocal
)
rd %mytmp%
timeout 10