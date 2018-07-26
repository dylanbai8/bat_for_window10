@echo off
cd /d %~dp0
setlocal enabledelayedexpansion
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title 局域网IP随机配置
MODE con: COLS=40 lines=6
color 0a

set /a ip=%random% %% 38+130
echo.
echo.
echo   --[正在设置IP地址 192.168.1.%ip% ]--
cmd /c netsh interface ip set address name="WLAN" source=static addr=192.168.1.%ip% mask=255.255.255.0 gateway=192.168.1.1
echo.

ping 192.168.1.1 -n 3 > nul
exit
