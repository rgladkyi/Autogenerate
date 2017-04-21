
set AUTO_GEN_SCRIPT_PATH=%1
set MIRROR_DIR_PATH=%2

call create_directory_if_not_exist.bat %MIRROR_DIR_PATH%

echo Generating commands..
call ll "C:\CMDEX\Interfaces\*.bat" > %AUTO_GEN_SCRIPT_PATH%
call sed -r -i "s/\.bat$//g" %AUTO_GEN_SCRIPT_PATH%

call sed -r -i "s/^/PLACE_FOR_COMMAND_TO_EXECUTE/g" %AUTO_GEN_SCRIPT_PATH%

call sed -i "s|PLACE_FOR_COMMAND_TO_EXECUTE|echo. >> C:\CMDEX\Mirror\|g" %AUTO_GEN_SCRIPT_PATH%
rem echo\. \>\> C\:\\CMDEX\\Mirror\\/g" %AUTO_GEN_SCRIPT_PATH%

echo Deleting old mirror..
del /q "C:\CMDEX\Mirror\*"
