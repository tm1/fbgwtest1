@echo off
echo ----------------------------------------------------------------------
echo Firebird DBMS (1.5, 2.0, 2.5, greater) Windows Service installer ver. 0.2.4
echo .     This utility should be located and run from the 'bin' directory
echo .     of your Firebird installation.
echo ----------------------------------------------------------------------
echo [info] [ %date% ~ %time% ]   WorkDir is "%cd%"
echo [info] [ %date% ~ %time% ]   SelfDir is "%~dp0"
echo ----------------------------------------------------------------------
set _test_Wow6432Node_=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node
set _reg_x86_=HKEY_LOCAL_MACHINE\SOFTWARE\Firebird Project\Firebird Server\Instances
set _reg_Wow6432Node_=HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Firebird Project\Firebird Server\Instances
set _instancename_=DefaultInstance
set _instanceoption_=
if not h%2h == hh   set _instancename_=%2& set _instanceoption_=-name %2
echo [info] [ %date% ~ %time% ]   Instance name is "%_instancename_%"
echo ----------------------------------------------------------------------
set _installdir_=..
rem -- if exist "%ProgramFiles%\Firebird\bin\fbserver.exe"   set _installdir_="%ProgramFiles%\Firebird"
if exist "%ProgramFiles(x86)%\Firebird\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   Found dir "%ProgramFiles%\Firebird"
rem -- if exist "%ProgramFiles(x86)%\Firebird\bin\fbserver.exe"   set _installdir_="%ProgramFiles(x86)%\Firebird"
if exist "%ProgramFiles(x86)%\Firebird\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   Found dir "%ProgramFiles(x86)%\Firebird"
rem -- if exist "%ProgramFiles%\Firebird\Firebird_1_5\bin\fbserver.exe"   set _installdir_="%ProgramFiles%\Firebird\Firebird_1_5"
if exist "%ProgramFiles(x86)%\Firebird\Firebird_1_5\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   Found dir "%ProgramFiles%\Firebird\Firebird_1_5"
rem -- if exist "%ProgramFiles(x86)%\Firebird\Firebird_1_5\bin\fbserver.exe"   set _installdir_="%ProgramFiles(x86)%\Firebird\Firebird_1_5"
if exist "%ProgramFiles(x86)%\Firebird\Firebird_1_5\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   Found dir "%ProgramFiles(x86)%\Firebird\Firebird_1_5"
rem -- if exist "%ProgramFiles%\Firebird\Firebird_2_5\bin\fbserver.exe"   set _installdir_="%ProgramFiles%\Firebird\Firebird_2_5"
if exist "%ProgramFiles(x86)%\Firebird\Firebird_2_5\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   Found dir "%ProgramFiles%\Firebird\Firebird_2_5"
rem -- if exist "%ProgramFiles(x86)%\Firebird\Firebird_2_5\bin\fbserver.exe"   set _installdir_="%ProgramFiles(x86)%\Firebird\Firebird_2_5"
if exist "%ProgramFiles(x86)%\Firebird\Firebird_2_5\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   Found dir "%ProgramFiles(x86)%\Firebird\Firebird_2_5"
echo ----------------------------------------------------------------------
if exist "%~dp0..\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   InstallDir is "%~dp0..\" & set _installdir_=%~dp0..& goto _step1
if exist "%~dp0bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   InstallDir is "%~dp0" & set _installdir_=%~dp0& goto _step1
if exist "%cd%\..\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   InstallDir is "%cd%\..\" & set _installdir_="%cd%\..& goto _step1
if exist "%cd%\bin\fbserver.exe"   echo [info] [ %date% ~ %time% ]   InstallDir is "%cd%\" & set _installdir_="%cd%& goto _step1
echo [error] [ %date% ~ %time% ]   Firebird WorkDir is not found !
goto _help
  :_step1
set _svcuser_=Firebird
set _svcpassword_=pleaseenteryourdefaultpasswordhere
echo ----------------------------------------------------------------------
set _choice_=help
if h%1h == hinstall-ssh   set _choice_=superserver
if h%1h == hish   set _choice_=superserver
if h%1h == hinstall-csh   set _choice_=classic
if h%1h == hich   set _choice_=classic
if h%1h == hinstall-msh   set _choice_=multithreaded
if h%1h == himh   set _choice_=multithreaded
if h%1h == hremoveh   set _choice_=remove
if h%1h == hrh   set _choice_=remove
echo [info] [ %date% ~ %time% ]   Choice is "%_choice_%"
if h%_choice_%h==hremoveh   goto _remove
if not h%_choice_%h==hhelph   goto _install
  :_help
echo ----------------------------------------------------------------------
echo Usage: 
echo .     %0 install-ss / is [DefaultInstance]
echo .     %0 install-cs / ic [SecondInstance]
echo .     %0 install-im / im [ThirdInstance]
echo .     %0 remove / r [NameOfInstance]
goto _exit
  :_install
net user %_svcuser_%
echo ----------------------------------------------------------------------
echo y| net user %_svcuser_% %_svcpassword_% /add 2> nul
net user %_svcuser_% /expires:never /passwordchg:no
wmic path Win32_UserAccount where Name='%_svcuser_%' set PasswordExpires=false
echo [info] [ %date% ~ %time% ]   User %computername%\%_svcuser_% is added. Please change default password for service user.
echo ----------------------------------------------------------------------
net user %_svcuser_%
rem ## start compmgmt.msc
echo ----------------------------------------------------------------------
echo For x86 system use [HKEY_LOCAL_MACHINE\SOFTWARE\Firebird Project\Firebird Server\Instances]
echo For x64 system use [HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Firebird Project\Firebird Server\Instances]
echo ----------------------------------------------------------------------
echo [info] [ %date% ~ %time% ]   Installing Firebird service instance to Windows registry.
echo ----------------------------------------------------------------------
dir /a "%_installdir_%\firebird.conf"
echo ----------------------------------------------------------------------
rem -- echo REGEDIT4> "%temp%\$FirebirdInstance$.reg"
rem -- echo.>> "%temp%\$FirebirdInstance$.reg"
rem -- echo [HKEY_LOCAL_MACHINE\SOFTWARE\Firebird Project\Firebird Server\Instances]>> "%temp%\$FirebirdInstance$.reg"
rem -- echo "%_instancename_%"="%_installdir_%">> "%temp%\$FirebirdInstance$.reg"
rem -- echo.>> "%temp%\$FirebirdInstance$.reg"
rem -- echo.>> "%temp%\$FirebirdInstance$.reg"
rem -- echo Y| copy /b "%temp%\$FirebirdInstance$.reg" "%_installdir_%"
rem -- %SystemRoot%\system32\reg.exe import "%temp%\$FirebirdInstance$.reg"
reg query "%_reg_x86_%"
reg query "%_reg_Wow6432Node_%"
echo ----------------------------------------------------------------------
reg query "%_test_Wow6432Node_%" >nul || echo x86 && echo y| reg add "%_reg_x86_%" /v %_instancename_% /t REG_SZ /f /d "%_installdir_%"
reg query "%_test_Wow6432Node_%" >nul && echo Wow6432Node && echo y| reg add "%_reg_Wow6432Node_%" /v %_instancename_% /t REG_SZ /f /d "%_installdir_%"
echo ----------------------------------------------------------------------
reg query "%_reg_x86_%" /v %_instancename_%
reg query "%_reg_Wow6432Node_%" /v %_instancename_%
echo ----------------------------------------------------------------------
echo [info] [ %date% ~ %time% ]   Installing Firebird service as %_choice_% with default password for service user.
echo ----------------------------------------------------------------------
rem instsvc.exe install "%ProgramFiles%\Firebird\Firebird_2_5" -auto -superserver -z -name DefaultInstance
rem instsvc.exe install "%ProgramFiles%\Firebird\Firebird_2_5" -auto -classic -z -name SecondInstance
rem instsvc.exe install "%ProgramFiles%\Firebird\Firebird_2_5" -auto -multithreaded -z -name ThirdInstance
if exist "%_installdir_%\bin\instsvc.exe"   "%_installdir_%\bin\instsvc.exe" install -auto -%_choice_% -l %computername%\%_svcuser_% %_svcpassword_% -g -z %_instanceoption_%
if not exist "%_installdir_%\bin\instsvc.exe"   echo [error] [ %date% ~ %time% ]   Firebird binary instsvc.exe is not found !
echo ----------------------------------------------------------------------
if exist "%_installdir_%\%computername%.lck" goto _continue1
echo Creating "%_installdir_%\%computername%.lck"
echo .> "%_installdir_%\%computername%.lck"
copy nul "%_installdir_%\%computername%.lck" /Y > nul
echo ----------------------------------------------------------------------
:_continue1
if exist "%_installdir_%\%computername%.evn" goto _continue2
echo Creating "%_installdir_%\%computername%.evn"
echo .> "%_installdir_%\%computername%.evn"
copy nul "%_installdir_%\%computername%.evn" /Y > nul
echo ----------------------------------------------------------------------
:_continue2
if exist "%_installdir_%\Firebird.log" goto _continue3
echo Creating "%_installdir_%\Firebird.log"
echo .> "%_installdir_%\Firebird.log"
copy nul "%_installdir_%\Firebird.log" /Y > nul
echo ----------------------------------------------------------------------
:_continue3
echo [info] [ %date% ~ %time% ]   Changing ACLs for these files.
echo ----------------------------------------------------------------------
cacls.exe "%_installdir_%\firebird.msg" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\firebird.conf" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\aliases.conf" /e /g %computername%\%_svcuser_%:r
if exist "%_installdir_%\security.fdb"   cacls.exe "%_installdir_%\security.fdb" /e /g %computername%\%_svcuser_%:c
if exist "%_installdir_%\security2.fdb"   cacls.exe "%_installdir_%\security2.fdb" /e /g %computername%\%_svcuser_%:c
cacls.exe "%_installdir_%\security*.fdb" /e /g %computername%\%_svcuser_%:c
cacls.exe "%_installdir_%\%computername%.lck" /e /g %computername%\%_svcuser_%:c
cacls.exe "%_installdir_%\%computername%.evn" /e /g %computername%\%_svcuser_%:c
cacls.exe "%_installdir_%\Firebird.log" /e /g %computername%\%_svcuser_%:c
cacls.exe "%_installdir_%\bin\*.exe" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\bin\*.dll" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\intl" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\intl\fbintl.conf" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\intl\fbintl.dll" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\UDF" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\UDF\*.dll" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\fbtrace.conf" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\plugins" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\plugins\fbtrace.dll" /e /g %computername%\%_svcuser_%:r
cacls.exe "%_installdir_%\plugins\*.dll" /e /g %computername%\%_svcuser_%:r
goto _exit
  :_remove
echo ----------------------------------------------------------------------
echo [info] [ %date% ~ %time% ]   Removing Firebird instance from services. User is not deleted. Do it yourself.
echo ----------------------------------------------------------------------
net user %_svcuser_%
echo ----------------------------------------------------------------------
echo Command to delete user :   net user %_svcuser_% /delete
rem -- net user %_svcuser_% /delete
rem -- net user %_svcuser_%
echo ----------------------------------------------------------------------
rem instsvc.exe remove -z -name DefaultInstance
if exist "%_installdir_%\bin\instsvc.exe"   "%_installdir_%\bin\instsvc.exe" remove -z %_instanceoption_%
if not exist "%_installdir_%\bin\instsvc.exe"   echo [error] [ %date% ~ %time% ]   Firebird binary instsvc.exe is not found !
  :_exit
echo ----------------------------------------------------------------------
echo [info] [ %date% ~ %time% ]   "%_installdir_%\bin\instsvc.exe" query
if exist "%_installdir_%\bin\instsvc.exe"   "%_installdir_%\bin\instsvc.exe" query
if not exist "%_installdir_%\bin\instsvc.exe"   echo [error] [ %date% ~ %time% ]   Firebird binary instsvc.exe is not found !
echo ----------------------------------------------------------------------
reg query "%_reg_x86_%"
reg query "%_reg_Wow6432Node_%"
echo ----------------------------------------------------------------------
set _instancename_=
set _instanceoption_=
set _choice_=
set _installdir_=
set _svcuser_=
set _svcpassword_=
set _reg_x86_=
set _reg_Wow6432Node_=
rem Done.
