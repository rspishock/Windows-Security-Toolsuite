@echo off
rem *********************************************
rem * Title:        	Windows_STS.cmd        	*
rem * Author:       	Ryan Spishock        	*
rem * Email:        	ryan.spishock@gmail.com *
rem * Date created:     December 31, 2011       *
rem * Last Modified:	February 19, 2012       *
rem * Description:                				*
rem *********************************************

title Windows security testing tool suite

rem *********************************************
rem #           Set return variable        		*
rem *********************************************
set directory=%1
set return=%2

rem *********************************************
rem *        Environmental preperation   		*
rem *********************************************
set directory=c:\Security__Test_%date:~4,4%-%date:~10,2%-%date:~7,2%_%time:~0,2%%time:~3,2%_%time:~6,5%
if exist '%directory%' (
    echo y | rd /s '%directory%'
)
md '%directory%'
cd '%directory%'
goto End
:End

rem *********************************************
rem *           	 Main menu        			*
rem *********************************************
echo:
echo Security testing Windows tool suite
echo Main menu:
echo    1. Run scans
echo    2. Transfer results
echo    3. Clean up tools
echo    4. Quit
echo	h. Help file
echo:
set /p menu=Enter the task to perform: 

if '%menu%' == '1' goto Run
else if '%menu%' == '2' goto Transfer
else if '%menu%' == '3' goto Clean
else if '%menu%' == '4' goto Quit
else if '%menu%' == 'h' goto Help
else 

rem *********************************************
rem *           	 Scan menu       			*
rem *********************************************
:Run
echo:
echo Current tools:
echo:
echo System scans
echo:
echo Network scans
echo:
echo Other scans
echo    9. Run all scans
echo:

set /p choice=Enter which scan you want to run: 

rem *********************************************
rem *           Set return variable      		*
rem *********************************************
if '%choice%' lss '9' (
    set return=n
)

rem *********************************************
rem *           Call test scripts        		*
rem *********************************************
if '%choice%' == '1' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '2' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '3' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '4' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '5' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '6' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '7' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '8' call "c:\scripts\.cmd" '%directory%' '%return%'
else if '%choice%' == '9' call "c:\scripts\all.cmd
else

goto Menu

rem *********************************************
rem *        	Transfer findings        		*
rem *********************************************
:Transfer
rem User specifies login credentials
echo Scans complete.  Preparing to transfer results.
echo:
set /p ip=Enter the destination IP.
set /p uname=Enter the username to connect with: 
set /p password=Enter the '%uname%'/'s password: 

rem Copies findings to target host in verbose mode
pscp -v -r -p -pw '%password%' c:/Security_Test\ '%uname%'@'%ip%':/tmp/Security_Test/Windows_STS/

goto Menu

rem *********************************************
rem *        	Clean up environment     	    *
rem *********************************************
:Clean
rem Removes the "c:\Security_Test" directory and it's contents
rem once the transfer is complete.
echo Before deleting the results, make sure that you transferred them to another system.
set /p delete=Are you sure you want to delete the results? 
if '%delete%' == y (
    echo y | rd /s "c:\Security_Test"
) else (
    echo Transfer the results to another system and run cleanup again!
    goto Transfer
)

goto Menu

:Quit
echo Windows STS has completed.
rem Script stops here until user presses a key to close the window.
call pause
exit

rem *********************************************
rem *        			Help file     	    	*
rem *********************************************
:Help