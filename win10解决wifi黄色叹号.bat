@echo off
cd /d %~dp0

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title --IP自动设置 --
MODE con: COLS=60 lines=16
color 0a

:begin
cls
MODE con: COLS=60 lines=16
echo.
echo.
echo --[1]--把IP设置为自动获取
echo --[2]--把IP设置为 192.168.1.167
echo --[3]--退出
echo --[4]--把DNS设置为 8.8.8.8
echo.
echo.
echo --注意--用TXT打开替换WLAN为你的本地连接名称
echo --注意--替换你要设置的路由器网关和静态IP地址
echo --注意--尝试 1、2 轮回切换解决IP冲突导致的黄色叹号
echo.
echo.
choice /c 1234 /n /m "请选择【1-4】："

echo %errorlevel%
if %errorlevel% == 1 goto set_ip1_ip
if %errorlevel% == 2 goto set_ip2_ip
if %errorlevel% == 3 goto end
if %errorlevel% == 4 goto set_ip4_ip
else (goto begin)


:set_ip1_ip
cls
echo.
echo.
echo.
echo --IP自动设置开始--
echo.
echo --[正在把IP设置为 自动获取]--
netsh interface ip set address name = "WLAN" source = dhcp
echo.
echo --设置完成，按任意键返回开始菜单--
ping localhost -n 2 > nul
goto begin


:set_ip2_ip
cls
echo.
echo.
echo.
echo --[正在设置IP地址、网掩码、网关]--
cmd /c netsh interface ip set address name="WLAN" source=static addr=192.168.1.167 mask=255.255.255.0 gateway=192.168.1.1
echo.
echo --设置完成，按任意键返回开始菜单--
ping localhost -n 2 > nul
goto begin

:set_ip4_ip
cls
echo.
echo.
echo.
echo --[正在设置DNS为 8.8.8.8/8.8.4.4]--
cmd /c netsh interface ip set dns name="WLAN" source=static 8.8.8.8
cmd /c netsh interface ip add dns name="WLAN" 8.8.4.4
echo --设置完成，按任意键返回开始菜单--
ping localhost -n 3 > nul
goto begin

:end
exit