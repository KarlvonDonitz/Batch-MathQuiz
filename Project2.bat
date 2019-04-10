@echo off
setlocal ENABLEDELAYEDEXPANSION
title Math_Quiz_Answer
cls
set path=%~dp0
set path=%path%Answers.txt
c:>%path%
:file_reader
for /f "delims==" %%i in (%1) DO (
set string=%%i
set /a ans=!string!
echo !string!=!ans!>>%path%
)
:end
echo All questions have been answered and entered into %path%
pause