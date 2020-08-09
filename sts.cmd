@echo off
rem #############################################
rem # Title:			sts.com					#
rem # Author:			Ryan Spishock			#
rem # Email:			ryan.spishock@me.com	#
rem # Date created:		August 11, 2011			#
rem # Last modified:	September 9, 2011		#
rem # Description:		Connects to a remote	#
rem #					Windows system and 		#
rem #					gathers information		#
rem #					about the current 		#
rem #					state of the system.	#
rem #############################################

title Enigma Networks: Windows security tool suite

rem #########################################
rem #		Set environmental variables		#
rem #########################################



rem #########################################
rem #				Main menu				#
rem #########################################
:Menu
echo:
echo Security testing Windows tool suite
echo Main menu:
echo    1. Run scans
echo    2. Transfer results
echo    3. Clean up tools
echo    4. Quit
echo:
set /p menu=Enter the task to perform: 

if %menu% == 1 (
	goto Run
) else if %menu% == 2 (
	goto Transfer
) else if %menu% == 3 (
	goto Clean
) else if %menu% == 4 
	goto Quit
)



rem #########################################
rem #				Scan menu				#
rem #########################################


rem #########################################
rem #			Clean up tools				#
rem #########################################
:Clean
rem Removes the "c:\Enigma_Security_Test" directory and it's contents
rem once the transfer is complete.
echo Before deleting the results, make sure that you transferred them to another system.
set /p delete=Are you sure you want to delete the results? 
if %delete% == y (
    echo y | rd /s %directory%
) else (
    echo Transfer the results to another system and run cleanup again!
    goto Transfer
)

goto Menu

rem #########################################
rem #			Exit tool suite				#
rem #########################################
:Quit
echo Windows STS scans have completed.
rem Script stops here until user presses a key to close the window.
call pause
exit