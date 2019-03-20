@echo off
set string=
set /a flag=%random% %% 8
set /a flag=flag+1
set string=%string%%flag%
set k=1
:number
set count=1
set /a flag=%random% %% 8
set /a flag=%flag%+1
set string=%string%%flag%
set /a k =%k%+1
if %k% equ 50 goto output
set /a flag=%random% %% 9
if %flag% LEQ 4 goto nextnumber
:operator
set /a flag=%random% %% 4
if %flag% EQU 0 set string=%string%+
if %flag% EQU 1 set string=%string%-
if %flag% EQU 2 set string=%string%*
if %flag% EQU 3 set string=%string%/
goto number
:nextnumber
set /a flag=%random% %% 9
set string=%string%%flag%
set /a count=count+1
if %count% EQU 5 goto operator
set /a k =%k%+1
if %k% equ 50 goto output
set /a flag=%random% %% 9
if %flag% LEQ 4 goto operator
goto nextnumber
:output
echo %string%
pause