@echo off
net start wuauserv
sc config wuauserv start= auto