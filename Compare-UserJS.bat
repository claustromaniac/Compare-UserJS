@ECHO OFF
:: Place this in the same folder as Compare-UserJS.ps1 and run it. Provided only for the layman's convenience.
TITLE %~n0
IF NOT EXIST "%~n0.ps1" (
	ECHO: %~n0.ps1 not found in the current directory. Aborting.
	GOTO :EOF
)
PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~pn0.ps1' %*"

:: PROtip: rename this script to match the name of any other PS script to run it. How cool is that?