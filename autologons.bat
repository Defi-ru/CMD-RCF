@echo off
cls

chcp 65001

call settings.bat


SET USER=%2

IF "%1"=="-e" GOTO ENABLE
IF "%1"=="-d" GOTO DISABLE
echo "Bad arguments. Choise -e to Enable autologon, -d to Disable autologon and then username"
GOTO EndScript

:ENABLE
echo " --------------- Connect Net Folder"
%PSEXEC-EXEC% net use %REPOSITORY% /user:%REPCOMPUTER%\%REPUSER% %REPPASS%

echo "---------------- Copy Autologon to System32"
%PSEXEC-EXEC% xcopy /Y %REPOSITORY%\autologon.exe C:\Windows\System32

echo "---------------- Disconnect Net Folder"
%PSEXEC-EXEC% net use /delete %REPOSITORY%

echo "---------------- Set user: %USER% to Autologon"
%PSEXEC-EXEC% autologon -accepteula %REMOTEUSER% 192.168.130.109 %REMOTEPASS%

GOTO EndScript

:DISABLE
echo "------------------- Disable Autologon"
%PSEXEC-EXEC% reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultDomainName /f
%PSEXEC-EXEC% reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f

GOTO EndScript

:EndScript
rem Pause



