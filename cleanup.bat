@echo off
setlocal

REM List of files and directories to keep (adjust as per your application's needs)
set "essential_files=ModellingChecklist.py python311.dll tkinter tcl tk Images"

REM Loop through all files and directories in the current directory
for /f "tokens=*" %%a in ('dir /b /a-d') do (
    REM Check if the file or directory is in the list of essential files
    echo %essential_files% | findstr /i "\<%%a\>" >nul
    if errorlevel 1 (
        REM If not found in the essential files list, hide the file or directory
        attrib +h "%%a"
    )
)

REM Loop through all directories in the current directory
for /d %%a in (*) do (
    REM Check if the directory is in the list of essential files
    echo %essential_files% | findstr /i "\<%%a\>" >nul
    if errorlevel 1 (
        REM If not found in the essential files list, hide the directory
        attrib +h "%%a"
    )
)

endlocal