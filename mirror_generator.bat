@echo off

set AUTO_GEN_SCRIPT_PATH=%1
set MIRROR_DIR_PATH=%2

set COMMAND_FOR_EXECUTE_WRAPPED=%3
echo %COMMAND_FOR_EXECUTE_WRAPPED%
rem Remove " "
set COMMAND_FOR_EXECUTE=%COMMAND_FOR_EXECUTE_WRAPPED:"=%
echo %COMMAND_FOR_EXECUTE%

set FILE_TO_PROCESS_PATH=%4

call create_directory_if_not_exist.bat %MIRROR_DIR_PATH%

rem call ll "%CMDEX_ROOT_DIR%\Interfaces\*.bat" > %AUTO_GEN_SCRIPT_PATH%
rem call sed -r -i "s/\.bat$//g" %AUTO_GEN_SCRIPT_PATH%

echo Generating commands..
copy %FILE_TO_PROCESS_PATH% %AUTO_GEN_SCRIPT_PATH%
call sed -r -i "s/^/PLACE_FOR_COMMAND_TO_EXECUTE/g" %AUTO_GEN_SCRIPT_PATH%
call sed -i "s|PLACE_FOR_COMMAND_TO_EXECUTE|%COMMAND_FOR_EXECUTE%|g" %AUTO_GEN_SCRIPT_PATH%

rem echo Deleting old mirror..
rem del /q "%CMDEX_ROOT_DIR%\Mirror\*"



 