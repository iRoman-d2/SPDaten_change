@echo off
set NFSDIR=C:\BMWSOFT\EC-APPS\NFS
set NCSEXPERDIR=C:\BMWSOFT\NCSEXPER
set EDIABASDIR=C:\BMWSOFT\EDIABAS
set SPDATENDIR=D:\bmwstore\BMW SP-Daten 69.0

set BODIES=
for /f "delims=" %%a in ('dir "%SPDATENDIR%" /B /A:D') do (
 call set BODIES=%%BODIES%% %%a
)
:SELECT_BODY
echo ����㯭� �㧮��:%BODIES%
set BODY=
set /P BODY=������ �㧮�: 
IF NOT EXIST "%SPDATENDIR%\%BODY%\ECU" (
    echo �㧮�� "%BODY%" ��� � "%SPDATENDIR%"
	goto SELECT_BODY
)

rd /S /Q "%NFSDIR%\SGDAT"
rd /S /Q "%NFSDIR%\DATA"
rd /S /Q "%NCSEXPERDIR%\SGDAT"
rd /S /Q "%EDIABASDIR%\ECU"
mklink /D "%NFSDIR%\SGDAT" "%SPDATENDIR%\%BODY%\sgdat"
mklink /D "%NFSDIR%\DATA" "%SPDATENDIR%\%BODY%\data"
mklink /D "%NCSEXPERDIR%\SGDAT" "%SPDATENDIR%\%BODY%\sgdat"
mklink /D "%EDIABASDIR%\ECU" "%SPDATENDIR%\%BODY%\ecu"
pause
ren %~dpnx0 %BODY%_change.bat