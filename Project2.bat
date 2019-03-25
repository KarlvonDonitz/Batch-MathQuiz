@echo on
if exist %1 goto file_reader
set /a ans=%1
echo %ans%
goto end
:file_reader
for /f "delims==" %%a in (%1) do set string=%%a
set /a ans=%string%
echo %ans%
:end
pause