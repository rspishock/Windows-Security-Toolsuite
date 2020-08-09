@echo off
rem *********************************************
rem * Title:        	wmic.cmd        		*
rem * Author:       	Ryan Spishock        	*
rem * Email:        	ryan.spishock@me.com    *
rem * Date created:    	February 22, 2012       *
rem * Last Modified:    February 22, 2012       *
rem * Description:        				        *
rem *********************************************

title Windows security testing tool suite: wmic.cmd

rem *********************************************
rem #           Set return variable        *
rem *********************************************
set directory=%1
set return=%2

rem *********************************************
rem *        Environmental preperation    *
rem *********************************************
if exist '%directory%' (
    echo y | rd /s '%directory%'
)
md '%directory%'
cd '%directory%'
goto End
:End

rem *********************************************
rem *             Tool execution        *
rem *********************************************
echo Now running:
echo 	qfe list full
wmic qfe list full/translate:basicxml/format:rawxml.sxl >> iava.xml
wmic qfe list full >> iava.xml
echo:
echo 	systeminfo FO
systeminfo /FO csv >> systeminfo.csv
systeminfo >> systeminfo.txt
echo now finished.

rem *********************************************
rem *         Return to controlling script    *
rem *********************************************
cd ..

if '%return%' == 'y' (
    call "c:\scripts\all.cmd
) else (
    call "c:\tools.cmd"
)