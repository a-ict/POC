:batchservice
echo "starting batch service"
start cmd /k startbatch.bat
timeout 50 >nul
netstat -an | findstr LISTEN | findstr 3038
if %ERRORLEVEL% == 0 goto :accountservice
echo "Errors encountered during batch execution.  Exited with status: %errorlevel%"
goto :endofscript

:accountservice
echo "starting account service"
start cmd /k startaccounts.bat
timeout 50 >nul
netstat -an | findstr LISTEN | findstr 3000
if %ERRORLEVEL% == 0 goto :claimservice
echo "Errors encountered during accounts service execution.  Exited with status: %errorlevel%"
goto :endofscript

:claimservice
echo "starting claim services"
start cmd /k startclaim.bat
timeout 60 >nul
netstat -an | findstr LISTEN | findstr 3034
if %ERRORLEVEL% == 0 goto :accountsui
echo "Errors encountered during claim service execution.  Exited with status: %errorlevel%"
goto :endofscript

:accountsui
echo "starting accounts ui"
start cmd /k startaccountsui.bat
timeout 100 >nul
netstat -an | findstr LISTEN | findstr 3003
if %ERRORLEVEL% == 0 goto :completed
echo "Errors encountered during execution.  Exited with status: %errorlevel%"
goto :endofscript

:completed
echo "completed sucessfully"
exit 0

:endofscript
echo "Script failled"
