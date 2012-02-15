@echo off
echo ------------------
echo Cmdline is   : %0 %1 %2 %3 %4 %5 %6 %7 %8 %9
echo Started from : "%cd%"
echo Self place   : "%~dp0"
rem cd /d "%~dp0"
rem echo Workdir is   : "%cd%"
echo ------------------
echo.

set fb_isql=
set sql_script=%~dp0..\sqlscripts\dbcreate.sql
set db_dir=%~dp0..\db
set db_name=fbgwtest1
set db_path="%db_dir%\%db_name%.fdb"

@echo on
if not ["%ProgramFiles(x86)%"]==[""]   if exist "%ProgramFiles(x86)%\Firebird\Firebird_2_5\bin\isql.exe"   set fb_isql=%ProgramFiles(x86)%\Firebird\Firebird_2_5\bin\isql.exe
if not ["%ProgramFiles%"]==[""]   if exist "%ProgramFiles%\Firebird\Firebird_2_5\bin\isql.exe"   set fb_isql=%ProgramFiles%\Firebird\Firebird_2_5\bin\isql.exe
@echo off

echo [info]   Firebird isql path : %fb_isql%
echo [info]   DB path : %db_path%
echo [info]   SQL script path : %sql_script%
if not exist "%db_dir%"   md "%db_dir%"

@echo on
if not ["%fb_isql%"]==[""]   if exist "%sql_script%"   if not exist "%db_path%"   "%fb_isql%" -z -u sysdba -password masterkey -database "%db_path%" -input "%sql_script%"
@echo off

set db_path=
set db_name=
set db_dir=
set sql_script=
set fb_isql=
:l_exit
echo ------------------------------------
echo Done.
