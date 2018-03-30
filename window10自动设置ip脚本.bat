@echo off
cd /d %~dp0
%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title --IP自动设置 --
MODE con: COLS=60 lines=18
color 0a
  
:begin  
cls
MODE con: COLS=60 lines=18
echo.
echo.
echo --[1]--把IP设置为自动获取
echo --[2]--把IP设置为 192.168.1.167
echo --[3]--把IP设置为 192.168.1.168
echo --[4]--把DNS设置为自动获取
echo --[5]--把DNS设置为 119.29.29.29/114.114.114.114
echo --[6]--查看当前配置 ipconfig/all
echo --[0]--退出
echo.
echo.
echo --注意--用TXT打开并批量替换WLAN为你的本地连接名称
echo --注意--如果你的路由器网关不同请同时批量替换网关和IP
echo --注意--尝试1、2、3轮回切换解决IP冲突导致的黄色叹号
echo.
echo.
choice /c 1234560 /n /m "		请选择【0-6】："
 
echo %errorlevel%
if %errorlevel% == 1 goto set_ip1_ip  
if %errorlevel% == 2 goto set_ip2_ip  
if %errorlevel% == 3 goto set_ip3_ip  
if %errorlevel% == 4 goto set_ip4_ip  
if %errorlevel% == 5 goto set_ip5_ip  
if %errorlevel% == 6 goto set_ip6_ip  
if %errorlevel% == 0 goto end 
if %times% == 0 (goto vpn_connect) else (goto begin)  


:set_ip1_ip  
cls
echo.
echo.
echo IP自动设置开始....
echo.
echo --[正在把IP设置为自动获取]--
netsh interface ip set address name = "WLAN" source = dhcp
echo --[正在把DNS设置为自动获取]--
netsh interface ip set dns name = "WLAN" source = dhcp
echo 设置完成，按任意键返回开始菜单。
pause>nul
goto begin  


:set_ip2_ip  
cls
echo.
echo.
echo IP自动设置开始....
echo.
echo --[正在设置IP地址、网掩码、网关]--
cmd /c netsh interface ip set address name="WLAN" source=static addr=192.168.1.167 mask=255.255.255.0 gateway=192.168.1.1
echo 设置完成，按任意键返回开始菜单。
pause>nul
goto begin 

:set_ip3_ip 
cls
echo.
echo. 
echo IP自动设置开始....
echo.
echo --[正在设置IP地址、子网掩码、网关]--
cmd /c netsh interface ip set address name="WLAN" source=static addr=192.168.1.168 mask=255.255.255.0 gateway=192.168.1.1
echo 设置完成，按任意键返回开始菜单。
pause>nul
goto begin 

:set_ip4_ip  
cls
echo.
echo.
echo DNS自动设置开始....
echo.
echo --[正在设置DNS为自动获取]--
cmd /c netsh interface ip set dns name="WLAN" source=dhcp
echo 设置完成，按任意键返回开始菜单。
pause>nul
goto begin 

:set_ip5_ip  
cls
echo.
echo.
echo DNS自动设置开始....
echo.
echo --[正在设置DNS为119.29.29.29/114.114.114.114]--
cmd /c netsh interface ip set dns name="WLAN" source=static 119.29.29.29
cmd /c netsh interface ip add dns name="WLAN" 114.114.114.114
echo 设置完成，按任意键返回开始菜单。
pause>nul
goto begin 

:set_ip6_ip  
cls
echo.
echo.
echo.
MODE con: COLS=100 lines=60
ipconfig/all
echo.
echo.
echo 按任意键返回开始菜单
pause>nul
goto begin 

:end 
exit  