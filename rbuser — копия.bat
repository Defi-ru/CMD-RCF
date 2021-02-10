@echo off
cls
rem rbuser.bat
rem 27.09.2020

rem set UTF-8
chcp 65001

call settings.bat

echo 
rem no Active Directory
IF "%1"=="noad" GOTO NOAD


echo "------------------- Used AD user auth"
echo "------------------- Add user %USER% and changed his password"
psexec %REMOTEPC% -s net user %USER% %PASS% /ADD 
psexec %REMOTEPC% -s net user %USER% %PASS%
psexec %REMOTEPC% -s net localgroup %GROUP% %USER% /add

echo "------------------- Activate and change pass to local Admin (%ADMUSER%)"
psexec %REMOTEPC% -s net user %ADMUSER% /active:yes
psexec %REMOTEPC% -s net user %ADMUSER% %ADMPASS%

GOTO EndScript


:NOAD
echo "------------------- No AD. Local auth"
echo "------------------- Add user %USER% and changed his password"
psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS% net user %USER% %PASS% /ADD
psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS% net user %USER% %PASS% /fullname:"Royal Burger net user"
psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS% net localgroup %GROUP% %USER% /add

echo "------------------- Activate and change pass to local Admin (%ADMUSER%)"
psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS% net user %ADMUSER% /active:yes
psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS% net user %ADMUSER% %ADMPASS%



GOTO EndScript




:EndScript

rem Pause



