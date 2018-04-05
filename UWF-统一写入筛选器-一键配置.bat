@echo off
cd /d %~dp0

%1 start "" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)&exit

title -- UWF—统一写入筛选器 --
color 0a

:begin
cls
echo.
echo.
echo --[1]--开启UWF—统一写入筛选器
echo --[2]--查看UWF当下配置
echo --[3]--关闭UWF—统一写入筛选器
echo --[4]--关闭窗口
echo.
echo.
echo --注意--开启或者关闭时 重启系统才能生效
echo.
echo.
choice /c 1234 /n /m "请选择【1-4】："

echo %errorlevel%
if %errorlevel% == 1 goto set_1
if %errorlevel% == 2 goto set_2
if %errorlevel% == 3 goto set_3
if %errorlevel% == 4 goto end
else (goto begin)

:set_1
cls
echo.
echo.
uwfmgr filter enable
uwfmgr servicing enable
uwfmgr overlay set-size 2048
uwfmgr overlay set-warningthreshold 1536
uwfmgr overlay set-criticalthreshold 1792
uwfmgr overlay set-passthrough on
uwfmgr volume protect c:
uwfmgr file add-exclusion c:\users
uwfmgr servicing Update-Windows
pause > nul
goto begin

:set_2
cls
echo.
echo.
uwfmgr get-config
pause > nul
goto begin

:set_3
cls
echo.
echo.
uwfmgr filter disable
pause > nul
goto begin

:end
exit
