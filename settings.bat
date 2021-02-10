@echo off
cls

rem set UTF-8
chcp 65001

rem ----- Path Settings
rem don't use "" in RCFPATH
SET RCF-PATH=D:\SaveFolder\HotFolder\03.Windows\cmd\RemoteControlFramework
SET REPOSITORY=\\192.168.130.110\z-share\remotesoft
SET REPCOMPUTER=ws-pcab-130
SET REPUSER=netuser
SET REPPASS=pass

rem ----- User Settings
SET USER="helper"
SET PASS="gohr$94#Ghccd"
SET GROUP="Администраторы"

SET ADMUSER="Администратор"
SET ADMPASS="admnpass"

SET VNCPASS=8charect

rem ----- Remote PC Settings
SET REMOTEPC=\\192.168.230.109
SET REMOTEUSER=lage
SET REMOTEPASS=cronst


rem ----- Active Directory
SET AD="no"
IF %AD%=="yes" (SET PSEXEC-EXEC=psexec %REMOTEPC% -s) ELSE (SET PSEXEC-EXEC=psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS%)

%PSEXEC-EXEC% reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT


rem Pause

