@echo off
rem *********************************************
rem * Title:        	tool.cmd        		*
rem * Author:       	Ryan Spishock        	*
rem * Email:        	ryan.spishock@me.com    *
rem * Date created:    	August 5, 2011          *
rem * Last Modified:    August 5, 2011  	    *
rem * Description:        				        *
rem *********************************************

title Windows security testing tool suite

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