@echo off
cls

chcp 65001
call settings.bat


SET SOFT="%REPOSITORY%\tightvnc-2.8.27-gpl-setup-64bit.msi"
SET PARAM=SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=OctoSent SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=OctoSent

psexec \\192.168.130.109 -s -u rage -p livecd net use \\192.168.130.110\z-share\remotesoft /user:defiler-pc\netuser ga880ga
psexec %REMOTEPC% -s -u rage -p livecd msiexec /i %SOFT% /quiet /norestart %PARAM%
psexec %REMOTEPC% -s -u rage -p livecd net use /delete \\192.168.130.110\z-share\remotesoft

Pause