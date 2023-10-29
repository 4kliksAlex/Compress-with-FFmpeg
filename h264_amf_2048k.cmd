@echo off
set ti=%~n0
set mylist=%*
set mytmp=%tmp%\video-%random%
md %mytmp%
setlocal EnableDelayedExpansion
for %%i in (!mylist!) do (
endlocal
title %ti% - %%~nxi
ffmpeg.exe -i "%%~i" -c:v h264_amf -b:v 2048k -n "%mytmp%\%%~ni_2048k_H264.mp4"
move "%mytmp%\%%~ni_2048k_H264.mp4" "%%~dpni_2048k_H264.mp4"
setlocal
)
rd %mytmp%
timeout 10