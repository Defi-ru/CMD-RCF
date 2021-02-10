@echo off
rem ultravnc-reinstall.bat
rem Created 08.09.2020
rem To Royal Burger
cls

rem set UTF-8
chcp 65001


rem Plan:
rem * Remote Install
rem * Remote Uninstall
rem * Update Settings (Password)
rem * Choise 32/64-bit
rem * Add/remove Net Folder (Repository)

rem --------- SETTINGS ---------
SET SOFT="\\10.0.0.249\user\IT\Soft\Network\UltraVNC_1_2_50_X64_Setup.exe"
SET INFDIR="C:\Users\rage\Downloads\softinstall\silentvnc.inf"
SET INIDIRECT="C:\Users\rage\Downloads\softinstall\ultravnc.ini"
SET VNCDIR32="C:\Program Files (x86)\uvnc bvba\UltraVNC"
SET VNCDIR64="C:\Program Files\uvnc bvba\UltraVNC"
rem ----------------------------





echo "UltraVNC reinstaller"
@echo.
@echo.
echo "1. Install UltraVNC"
echo "2. Uninstall UltraVNC"
@echo.
 
SET /P INPUT="Your choise: "
 
if "%INPUT%"=="1" (%SOFT% /verysilent /loadinf=%INFDIR%)
if "%INPUT%"=="1" (copy /Y %INIDIRECT% %VNCDIR64% )
if "%INPUT%"=="2" (%VNCDIR64%\unins000.exe /VERYSILENT /NORESTART)
 