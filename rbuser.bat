@echo off
cls
rem rbuser.bat
rem 27.09.2020

rem set UTF-8
chcp 65001

call settings.bat

echo 

echo "------------------- Used AD user auth"
echo "------------------- Add user %USER% and changed his password"
%PSEXEC-EXEC% net user %USER% %PASS% /ADD
%PSEXEC-EXEC% net user %USER% %PASS% /fullname:"RB Net User"
%PSEXEC-EXEC% net localgroup %GROUP% %USER% /add

echo "------------------- Activate and change pass to local Admin (%ADMUSER%)"
%PSEXEC-EXEC% net user %ADMUSER% /active:yes
%PSEXEC-EXEC% net user %ADMUSER% %ADMPASS%



rem Pause



