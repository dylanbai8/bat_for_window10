@echo off
title 删除导航栏OneDrive图标
reg add "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /v Attributes /t REG_DWORD /d "0xf090004d" /f
echo OneDrive导航栏选项删除完成！