@echo off
cls
rem -------------- SETTINGS ---------------
SET TIGHTVNC="C:\Program Files\TightVNC\tvnviewer.exe"
SET VNCFILE="C:\Users\Rage\Desktop\222.vnc"

rem -------------- CODE --------------
%TIGHTVNC% -optionsfile=%VNCFILE%