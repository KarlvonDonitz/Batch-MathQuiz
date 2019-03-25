@echo off
title Math_Quiz_Generator
cls
setlocal ENABLEDELAYEDEXPANSION
set question_num=%1
set total=0
if defined %2 ( set input=%2 ) else ( set input=0 )
if exist %input% set path=%2
if %input% EQU New set path=%userprofile%\desktop\Question.txt
:start
set string=
set num=0 
set numflag=0
set length=0
set digit_length=0
set Max_digit_length=10
:first_number
set /a flag=%random%%%8+1
set string=%string%%flag%
set /a numflag=%numflag%+1
set num=%flag%
set /a flag=%random%%%2
set /a length=%length%+1
set /a digit_length=%digit_length%+1
if %digit_length% GEQ %Max_digit_length% goto print
if %flag% EQU 1 (goto operator) else (goto next_number)
:next_number
set /a flag=%random%%%9
set string=%string%%flag%
set num=%num%%flag%
set /a numflag=%numflag%+1
if %numflag% EQU 3 goto operator
set /a flag=%random%%%2
set /a length=%length%+1
set /a digit_length=%digit_length%+1
if %digit_length% GEQ %Max_digit_length% goto print
if %flag% EQU 1 (goto next_number) else (goto operator)
:operator
set /a flag=%random%%%4
if %flag% EQU 0 set string=%string%+
if %flag% EQU 1 set string=%string%-
if %flag% EQU 2 set string=%string%*
if %flag% EQU 3 goto division
set numflag=0
set num=
set /a length=%length%+1
goto first_number
:division
set /a k=%length%-%numflag%+1
set string=!string:~0,%k%!
set /a flag=%random%%%8+1
set /a tempnum=%num%*%flag%
set string=%string%%tempnum%/%num%
set str=%string%
set temp=0
:label
set /a temp+=1
set str=%str:~0,-1%
if defined str goto :label
set /a digit_length=%temp%-%length%-1+%digit_length%
set length=%temp%
set numflag=0
set num=
set /a flag=%random%%%3
if %flag% EQU 0 set string=%string%+
if %flag% EQU 1 set string=%string%-
if %flag% EQU 2 set string=%string%*
goto first_number
:print
echo %string%
if exist %path% goto output
:check
set /a total=%total%+1
if %total% EQU %question_num% goto end
goto start
:output
echo %string%=>>%path%
goto check
:end
if exist %path% echo All above question have been exported to %path%
pause