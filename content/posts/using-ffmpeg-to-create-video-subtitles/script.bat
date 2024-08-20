@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

set workdir=%~dp1
cd /d %workdir%

rem 视频画质
set quality=16
set filename=%~n1

if exist "%workdir%%filename%.srt" (
    set subtitle=%filename%.srt
) else if exist "%workdir%%filename%.ass" (
    set subtitle=%filename%.ass
) else (
    echo Error 找不到同名的 SRT 或 ASS 字幕文件
    pause
    goto :eof
)

if "%subtitle:~-3%" == "srt" (
    set vf=subtitles=%subtitle%
) else (
    set vf=ass=%subtitle%
)

echo 正在处理中...
ffmpeg -y -loglevel error -stats -i %~nx1 -vf %vf% -c:v libx264 -crf %quality% -c:a aac -ab 320k %~n1-output.mp4
echo 处理完成！

pause
