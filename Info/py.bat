@echo off

:: where all your Python versions located:
set _PTN_DIR=d:\InstSoft\Python

::set _PTN_INST=Anaconda3x86
set _PTN_INST=Conda3x64
::set _PTN_INST=MiniConda3x64
::set _PTN_INST=Py396x64

set _PTN_ACT=%_PTN_DIR%\%_PTN_INST%\condabin\conda.bat
if "%1" == "-getptninstvar" goto :eof

setlocal
set _PTN_DIR=%_PTN_DIR%\%_PTN_INST%
set _PTN_INST=

:: add activation as for Anaconda base environment
:: (safely skip in case of simple Python installation)
:: echo ACT: %_PTN_ACT%
if exist "%_PTN_ACT%" (
 echo Act: %_PTN_ACT% activate
 call "%_PTN_ACT%" activate
)
set _PTN_ACT=
set _PTN_RUN=%_PTN_DIR%\Python.exe

:PtnEnvOK
set _PTN_DIR=

:: Run Python executable
echo Run: %_PTN_RUN% 
echo Arg: %*
"%_PTN_RUN%" %*

:: Note: use 'start "TitleHere" "%_PTN_DIR%\pythonw.exe" %*' for GUI
goto :eof

:: eof
