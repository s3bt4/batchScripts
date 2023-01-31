@echo off
rem a.txt contains a String1 that should be replaced with String2
rem File a.txt is copied to a_backup.txt
rem Then the magic happens
copy a.txt a_backup.txt
(for /f "tokens=*" %%i in (a.txt) do (set "line=%%i" & :loop
    set "line=%line:String1=String2%"
    if not "%line:String1=%" == "%line%" goto loop
    echo %line%
)) > temp_file.txt & move /y temp_file.txt a.txt
