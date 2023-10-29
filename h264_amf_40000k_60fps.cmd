@echo off
set ti=%~n0
set mylist=%*
set mytmp=%tmp%\video-%random%
md %mytmp%
setlocal EnableDelayedExpansion
for %%i in (!mylist!) do (
endlocal
title %ti% - %%~nxi
ffmpeg.exe -i "%%~i" -c:v h264_amf -r 60 -b:v 40000k -n "%mytmp%\%%~ni_60fps.mp4"
move "%mytmp%\%%~ni_60fps.mp4" "%%~dpni_60fps.mp4"
setlocal
)
rd %mytmp%
timeout 10