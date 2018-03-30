@echo off
net stop wuauserv
sc config wuauserv start= disabled