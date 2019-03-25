@echo off
setlocal ENABLEDELAYEDEXPANSION
set string=
set num=0
set numflag=0
set length=0
set digit_length=0
set Max_digit_length=10
:frist_number
set /a flag=%random%%%8+1
set string=%string%%flag%
set /a numflag=%numflag%+1
set num=%flag%
set /a flag=%random%%%2
set /a length=%length%+1
set /a digit_length=%digit_length%+1
if %digit_length% GEQ %Max_digit_length% goto output
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
if %digit_length% GEQ %Max_digit_length% goto output
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
goto frist_number
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
goto frist_number
:output
echo %string%