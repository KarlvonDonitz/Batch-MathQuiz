@echo off
setlocal ENABLEDELAYEDEXPANSION
title Math_Quiz_Checker
cls
set path=%~dp0
set path=%path%Checker.txt
c:>%path%
:file_reader
for /f "tokens=1,2 delims==" %%i in (%1) DO (
set question=%%i
set answer=%%j
set /a check=!question!
if !answer! EQU !check! echo !question!=!answer! is Correct>>%path%
if !answer! NEQ !check! echo !question!=!answer! is Wrong>>%path%
)
:end
echo All problems in %1 have been checked and exported to %path%
pause