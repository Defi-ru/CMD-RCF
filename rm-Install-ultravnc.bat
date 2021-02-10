@echo off
cls

chcp 65001
call settings.bat

rem ----- Soft Settings
SET SOFT32=%REPOSITORY%\UltraVNC_1_2_50_X86_Setup.exe
SET SOFT64=%REPOSITORY%\UltraVNC_1_2_50_X64_Setup.exe
SET VNCINI=%REPOSITORY%\ultravnc.ini
IF %OS%==32BIT (SET SOFT=%SOFT32%) ELSE (SET SOFT=%SOFT64%)
SET INSTFOLDER="C:\Program Files\uvnc bvba\UltraVNC"
rem SET INSTFOLDER64=C:\Program Files\TightVNC
IF %OS%==32BIT (SET UNINSTALL-TIGHT=%UNINSTALL32%) ELSE (SET UNINSTALL-TIGHT=%UNINSTALL64%)
SET SERVICE=uvnc_service


IF "%1"=="-i" GOTO INSTALL
IF "%1"=="-c" GOTO CHANGESETTINGS
IF "%1"=="-u" (GOTO UNINSTALL)

echo "Bad arguments. Choise -i to Install, -c to Change Settings, -u to Unistall"
GOTO EndScript


rem ----- 1.Install Soft
:INSTALL
echo "Isntall Soft"
echo " --------------- Connect Net Folder"
%PSEXEC-EXEC% net use %REPOSITORY% /user:%REPCOMPUTER%\%REPUSER% %REPPASS%

echo " --------------- Install Soft"
%PSEXEC-EXEC% %SOFT% /verysilent /loadinf=%INF%

echo " --------------- Disconnect Net Folder"
%PSEXEC-EXEC% net use /delete %REPOSITORY%

GOTO EndScript


rem ----- 2.Change Password
:CHANGESETTINGS
echo "Change Password"
echo " --------------- Connect Net Folder"
%PSEXEC-EXEC% net use %REPOSITORY% /user:%REPCOMPUTER%\%REPUSER% %REPPASS%

echo " --------------- Install Soft"
%PSEXEC-EXEC% xcopy /y %VNCINI% %INSTFOLDER%
rem STOP
%PSEXEC-EXEC% sc stop %SERVICE%
rem cause a ~10 second sleep before checking the service state
echo "20 seconds waiting, service %SERVICE% is rebooting"
ping 127.0.0.1 -n 20 -w 1000 > nul
%PSEXEC-EXEC% sc start %SERVICE%

echo " --------------- Disconnect Net Folder"
%PSEXEC-EXEC% net use /delete %REPOSITORY%



GOTO EndScript


rem ----- 3.Uninstall
:UNINSTALL
echo "Uninstall Soft"

GOTO EndScript


:EndScript

rem Pause

exit 0