@ECHO OFF
MODE con: COLS=20 lines=3
color 0a

IF EXIST x: GOTO DELETE

cls
echo.
choice /c xd /n /m ".....�����룺"

if %errorlevel% == 1 goto BEGIN
if %errorlevel% == 2 goto RDXPAN

:BEGIN
IF EXIST c:\$Recycle.Bin\S-1-5-21-1730038240-488212901-628691585-1001\Xpan GOTO XPAN ELSE GOTO MDXPAN

:MDXPAN
MD c:\$Recycle.Bin\S-1-5-21-1730038240-488212901-628691585-1001\Xpan 1>nul 2>nul
GOTO XPAN

:XPAN
SUBST x: c:\$Recycle.Bin\S-1-5-21-1730038240-488212901-628691585-1001\Xpan 1>nul 2>nul
START x:
GOTO END

:DELETE
SUBST /D x:
GOTO END

:RDXPAN
rd /s /q c:\$Recycle.Bin\S-1-5-21-1730038240-488212901-628691585-1001\Xpan 1>nul 2>nul
GOTO END

:END
exit