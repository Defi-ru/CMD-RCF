@echo off
cls

rem set UTF-8
chcp 65001

SET RCFPATH="D:\SaveFolder\HotFolder\03.Windows\cmd\RemoteControlFramework"

rem Command Center:
rem %RCFPATH%\rbuser.bat
rem %RCFPATH%\psenable.bat noad
rem %RCFPATH%\rm-install-ultravnc.bat
rem autologons.bat -e rage
rm-install-ultravnc.bat -c

Pause