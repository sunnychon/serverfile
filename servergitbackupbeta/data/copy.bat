@echo off
echo %1 > copyercache
for /f %%i in (copyercache)  do (
set yuyuy=%%i)
if %yuyuy%==1 goto b
echo you cant double click to launch me
del /f copyercache
pause
exit
:b
del /f copyercache
title mc COPYER:1.1:copying files...
cd..
for /f %%i in (name.txt)  do (
set serverresp=%%i)
copy world/*.* %serverresp%
title mc COPYER:1.1:copying files...ok
dir %serverresp%
timeout 3
exit
