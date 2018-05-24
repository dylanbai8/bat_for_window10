@Echo Off
MODE con: COLS=60 lines=7
color 0a
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit
cd /d %~dp0
set pathv=%cd%\V2rayPro\v2ray\
set url=https://raw.githubusercontent.com/Alvin9999/PAC/master/config.json
sc stop v2ray 1>nul 2>nul
taskkill /im wv2ray.exe /f 1>nul 2>nul
start "" /d "%pathv%" "wv2ray.exe" -config=%url%
echo.
echo.
echo ---启动 V2ray 进程成功---
echo.
ping localhost -n 5 1>nul 2>nul