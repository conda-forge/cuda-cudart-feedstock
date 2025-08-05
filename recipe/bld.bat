if not exist %PREFIX% mkdir %PREFIX%
if not exist %LIBRARY_LIB%\x64 mkdir %LIBRARY_LIB%\x64
if not exist %LIBRARY_BIN%\x64 mkdir %LIBRARY_BIN%\x64

move lib\x64\* %LIBRARY_LIB%\x64
move bin\x64\* %LIBRARY_BIN%\x64
move include\cooperative_groups %LIBRARY_INC%
move include\* %LIBRARY_INC%
if %errorlevel% neq 0 exit /b 1
