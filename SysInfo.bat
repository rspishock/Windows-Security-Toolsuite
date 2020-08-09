rem *******************************************************
rem Script: SysInfo.bat
rem Creation Date: 2/28/2008
rem Last Modified: 3/15/2008
rem Author: William R. Stanek
rem E-mail: williamstanek@aol.com
rem *******************************************************
rem Description: Displays system configuration information
rem              including system name, IP configuration
rem              and Windows version.
rem *******************************************************
rem Files: Stores output in c:\data\current-sys.txt.
rem *******************************************************
hostname >> c:\data\current-sys.txt
ver >> c:\data\current-sys.txt
ipconfig -all >> c:\data\current-sys.txt