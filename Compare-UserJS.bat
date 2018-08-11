@ECHO OFF
:: Place this in the same folder as Compare-UserJS.ps1 and run it. Provided only for the layman's convenience.

:: This batch file launches the Compare-UserJS PowerShell script bypassing the PS execution policy.
:: Any and all of the parameters that you pass to this script will be relayed to the PS script.
:: You can even drag and drop the input files to this batch file (or to a shortcut pointing to it), if you want.

TITLE %~n0
IF EXIST "%~dpn0.ps1" (
	ECHO:Launching PowerShell...
	PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1' %*"
) ELSE ( ECHO: Script not found in the current directory. Aborting. )
PAUSE

:: PROTIP: rename this script to match the name of any other PS script to run it. How cool is that?
