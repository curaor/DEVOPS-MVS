@echo off

rem -- enter your username and your password
echo user %USERNAME%> ftpcmd.tmp
echo %PASSWORD%>> ftpcmd.tmp

rem -- put "input file" 'PDS/DS destination'
echo put "%WORKSPACE%\DEVOPS.PPLI\HELLO.pli" 'b136901.devops.ppli(hello)'>> ftpcmd.tmp
echo put "%WORKSPACE%\DEVOPS.JCL\PLAHELLO.jcl" 'b136901.devops.jcl(plahello)'>> ftpcmd.tmp

rem -- to connect to MVS JES Subcommand
echo quote site filetype=jes>> ftpcmd.tmp
rem -- ftp compile jcl to jes
echo get 'b136901.devops.jcl(plahello)' result1.txt>>ftpcmd.tmp
rem -- to view jobs in spool
echo dir>> ftpcmd.tmp
rem -- to go back to working directory
echo quote site filetype=seq>> ftpcmd.tmp

rem --
echo quit>> ftpcmd.tmp
ftp -n -s:ftpcmd.tmp %HOSTNAME%
del ftpcmd.tmp
type result1.txt