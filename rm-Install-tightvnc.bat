@echo off
cls

chcp 65001
call settings.bat


rem ----- Soft Settings
SET SOFT-TIGHT32=%REPOSITORY%\tightvnc-2.8.27-gpl-setup-32bit.msi
SET SOFT-TIGHT64=%REPOSITORY%\tightvnc-2.8.27-gpl-setup-64bit.msi
IF %OS%==32BIT (SET SOFT-TIGHT=%SOFT-TIGHT32%) ELSE (SET SOFT-TIGHT=%SOFT-TIGHT64%)
SET UNINSTALL-TIGHT32=C:\Program Files\TightVNC
SET UNINSTALL-TIGHT64=C:\Program Files\TightVNC
IF %OS%==32BIT (SET UNINSTALL-TIGHT=%UNINSTALL-TIGHT32%) ELSE (SET UNINSTALL-TIGHT=%UNINSTALL-TIGHT64%)
SET PARAM-TIGHT=SET_USEVNCAUTHENTICATION=1 VALUE_OF_USEVNCAUTHENTICATION=1 SET_PASSWORD=1 VALUE_OF_PASSWORD=%VNCPASS% SET_USECONTROLAUTHENTICATION=1 VALUE_OF_USECONTROLAUTHENTICATION=1 SET_CONTROLPASSWORD=1 VALUE_OF_CONTROLPASSWORD=%VNCPASS%

rem ----- 1.Install Soft
echo " --------------- Connect Net Folder"
%PSEXEC-EXEC% net use %REPOSITORY% /user:%REPCOMPUTER%\%REPUSER% %REPPASS%

echo " --------------- Install Soft"
%PSEXEC-EXEC% msiexec /i %SOFT-TIGHT% /quiet /norestart %PARAM-TIGHT%

echo " --------------- Disconnect Net Folder"
%PSEXEC-EXEC% net use /delete %REPOSITORY%

rem ----- 2.Change Password


rem ----- 3.Uninstall (DON't work)
rem if "%INPUT%"=="2" ("C:\Program Files\TightVNC\tvnserver.exe" -remove)
rem if "%INPUT%"=="2" (taskkill /IM "tvnserver.exe" /F)
rem if "%INPUT%"=="2" (rd /S /Q "C:\Program Files\TightVNC")
rem if "%INPUT%"=="2" (rd /S /Q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\TightVNC")
rem if "%INPUT%"=="2" (reg delete "HKLM\SOFTWARE\TightVNC\Server" /va /f)
rem if "%INPUT%"=="2" (reg delete "HKCU\SOFTWARE\TightVNC\Server" /va /f)




Pause

exit 0