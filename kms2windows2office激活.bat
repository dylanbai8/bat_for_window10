@echo off
cd /d %~dp0

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title --KMS激活widows和office便捷脚本--
MODE con: COLS=70 lines=15
color 0a





:begin
cls
echo.
echo.
echo     -- KMS 激活 widows 和 office 便捷脚本 --
echo.
echo --[1]--激活 widows 系统（Windows 7、8、10、2008、2012、2016）
echo --[2]--激活 office 软件（office 2010、2013、2016）
echo --[0]--退出脚本
echo.
echo.
choice /c 120 /n /m "		请选择【0-2】："
 
echo %errorlevel%
if %errorlevel% == 1 goto set_ip1_ip
if %errorlevel% == 2 goto set_ip2_ip
if %errorlevel% == 0 goto end 
if %times% == 0 (goto vpn_connect) else (goto begin)  




::激活widows系统
:set_ip1_ip
cls
echo.
echo.
echo --【请输入KMS服务器地址】
echo.
echo --默认激活服务器为 kms.03k.org
echo.
set/p kms=--默认直接按回车：
if not defined kms set kms=kms.03k.org
echo.
echo --配置成功，按【任意键】开始激活。
pause>nul
echo.
echo --正在激活，请稍后。。。。
slmgr /skms %kms%
slmgr /ato
ping localhost -n 3 > nul
slmgr /dlv
echo.
echo --激活已完成。按任意键返回开始菜单。
pause>nul
goto begin





::激活office软件
:set_ip2_ip
cls
echo.
echo.
echo --【请输入KMS服务器地址】
echo.
echo --默认激活服务器为 kms.03k.org
echo.
set/p kms=--默认直接按回车：
if not defined kms set kms=kms.03k.org
ping localhost -n 3 > nul
cls
echo.
echo.
echo --【请输入正确的office安装目录】
echo.
echo --默认为：C:\Program Files (x86)\Microsoft Office\Office14\
echo.
set/p url=--默认直接按回车：
if not defined url set url=C:\Program Files (x86)\Microsoft Office\Office14
echo.
echo --配置成功，按【任意键】开始激活。
pause>nul
echo.
echo --正在激活，请稍后。。。。
cd %url%
cscript ospp.vbs /sethst:%kms%
ping localhost -n 3 > nul
cscript ospp.vbs /act
echo.
echo --激活已完成。按任意键返回开始菜单。
echo.
pause>nul
goto begin





::关闭脚本
:end
exit