@echo off
set ti=%~n0
set mylist=%*
set mytmp=%tmp%\video-%random%
md %mytmp%
setlocal EnableDelayedExpansion
for %%i in (!mylist!) do (
endlocal
title %ti% - %%~nxi
ffmpeg.exe -hide_banner -i "%%~i" -c:v h264_amf -b:v 256k -n "%mytmp%\%%~ni_256k_H264.mp4"
move "%mytmp%\%%~ni_256k_H264.mp4" "%%~dpni_256k_H264.mp4"
setlocal
)
rd %mytmp%
timeout 10