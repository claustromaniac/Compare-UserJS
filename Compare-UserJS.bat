@ECHO OFF
:: Place this in the same folder as Compare-UserJS.ps1 and run it. Provided only for the layman's convenience.
TITLE %~n0
IF EXIST "%~n0.ps1" (
	PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~pn0.ps1' %*"
) ELSE ( ECHO: Script not found in the current directory. Aborting. )
PAUSE

:: PROtip: rename this script to match the name of any other PS script to run it. How cool is that?
