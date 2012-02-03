@echo off
set _instancename_=
if not h%2h == hh set _instancename_=-name %2
echo ----------------------------------------------------------------------
echo Instance name is "%2"
if h%1h == hinstall-ssh goto _installss
if h%1h == hish goto _installss
if h%1h == hinstall-csh goto _installcs
if h%1h == hich goto _installcs
if h%1h == hremoveh goto _remove
if h%1h == hrh goto _remove
  :_help
echo ----------------------------------------------------------------------
echo Usage: 
echo .     %0 install-ss / is [Instance_Name]
echo .     %0 install-cs / ic [Instance_Name]
echo .     %0 remove / r [Instance_Name]
goto _exit
  :_installss
echo ----------------------------------------------------------------------
echo Installing as superserver with default password
echo ----------------------------------------------------------------------
net user
net user Firebird pleaseenteryourdefaultpasswordhere /add
net user Firebird /expires:never /passwordchg:no
wmic path Win32_UserAccount where Name='Firebird' set PasswordExpires=false
echo User %computername%\Firebird is added. Please setup password.
net user
rem ## start compmgmt.msc
echo ----------------------------------------------------------------------
rem instsvc.exe install "%ProgramFiles%\Firebird\Firebird_1_5" -auto -superserver -z -name Instance_Name
instsvc.exe install -auto -superserver -l %computername%\Firebird pleaseenteryourdefaultpasswordhere -g -z %_instancename_%
goto _setacl
  :_installcs
echo ----------------------------------------------------------------------
echo Installing as classic with default password
echo ----------------------------------------------------------------------
net user
net user Firebird pleaseenteryourdefaultpasswordhere /add
net user Firebird /expires:never /passwordchg:no
wmic path Win32_UserAccount where Name='Firebird' set PasswordExpires=false
echo User %computername%\Firebird is added. Please setup password.
net user
rem ## start compmgmt.msc
echo ----------------------------------------------------------------------
rem instsvc.exe install "%ProgramFiles%\Firebird\Firebird_1_5" -auto -classic -z -name Instance_Name
instsvc.exe install -auto -classic -l %computername%\Firebird pleaseenteryourdefaultpasswordhere -g -z %_instancename_%
:_setacl
echo ----------------------------------------------------------------------
if exist "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.lck" goto _continue1
echo Creating "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.lck"
echo .> "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.lck"
copy nul "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.lck" /Y > nul
echo ----------------------------------------------------------------------
:_continue1
if exist "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.evn" goto _continue2
echo Creating "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.evn"
echo .> "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.evn"
copy nul "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.evn" /Y > nul
echo ----------------------------------------------------------------------
:_continue2
if exist "%ProgramFiles%\Firebird\Firebird_1_5\Firebird.log" goto _continue3
echo Creating "%ProgramFiles%\Firebird\Firebird_1_5\Firebird.log"
echo .> "%ProgramFiles%\Firebird\Firebird_1_5\Firebird.log"
copy nul "%ProgramFiles%\Firebird\Firebird_1_5\Firebird.log" /Y > nul
echo ----------------------------------------------------------------------
:_continue3
echo Changing ACLs for these files.
echo ----------------------------------------------------------------------
cacls.exe "%ProgramFiles%\Firebird\Firebird_1_5\security.fdb" /e /g %computername%\Firebird:c
cacls.exe "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.lck" /e /g %computername%\Firebird:c
cacls.exe "%ProgramFiles%\Firebird\Firebird_1_5\%computername%.evn" /e /g %computername%\Firebird:c
cacls.exe "%ProgramFiles%\Firebird\Firebird_1_5\Firebird.log" /e /g %computername%\Firebird:c
echo ----------------------------------------------------------------------
goto _exit
  :_remove
echo ----------------------------------------------------------------------
echo Removing from services. User is not deleted. Do it yourself.
echo ----------------------------------------------------------------------
echo net user
echo net user Firebird /delete
echo User %computername%\Firebird is deleted... or not.
net user
echo ----------------------------------------------------------------------
rem instsvc.exe remove -z -name	Instance_Name
instsvc.exe remove -z %_instancename_%
  :_exit
rem Done.
echo ----------------------------------------------------------------------
instsvc.exe q
