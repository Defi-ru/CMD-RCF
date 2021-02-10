@echo off
cls
rem ??.bat

rem set UTF-8
chcp 65001

call settings.bat

echo 
rem no Active Directory
IF "%1"=="noad" GOTO NOAD

echo "------------------- Used AD user auth"
echo "------------------- PowerShell Enable-PSRemoting"
echo "------------------- PowerShell Set-ExecutionPolicy Bypass"
rem << cmd /c "echo . | >> for supressed output message "terminate batch job" and stack this script
psexec %REMOTEPC% -s cmd /c "echo . | powershell Enable-PSRemoting
psexec %REMOTEPC% -s cmd /c "echo . | powershell Set-ExecutionPolicy Bypass

GOTO EndScript

:NOAD
echo "------------------- No AD. Local auth"
echo "------------------- PowerShell Enable-PSRemoting"
echo "------------------- PowerShell Set-ExecutionPolicy Bypass"
psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS% powershell Enable-PSRemoting
psexec %REMOTEPC% -s -u %REMOTEUSER% -p %REMOTEPASS% cmd /c "echo . | powershell Set-ExecutionPolicy Bypass

rem Test-WsMan 192.168.130.109

GOTO EndScript

:EndScript

rem Pause