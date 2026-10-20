@echo off
chcp 65001 >nul
cd /d "%~dp0"
rem ===== Destination Kepler（Ruffle 启动，固定 GL 图形后端）=====
if exist "player\ruffle\ruffle.exe" (
    start "" "player\ruffle\ruffle.exe" -g gl "game\destination-kepler-ruffle.swf"
) else (
    echo 未找到 Ruffle，请重新下载完整仓库。
    pause
)
exit /b
