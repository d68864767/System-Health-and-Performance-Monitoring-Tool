@echo off
cls

:: Check if the script is running with administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Running with administrative privileges
) else (
    echo Please run the script as an Administrator
    pause
    exit /b
)

:: Display current settings
echo Current Monitoring Settings:
echo.
type settings.txt
echo.

:: Menu for configuring settings
:menu
echo.
echo Configure Monitoring Settings:
echo 1. Set CPU usage threshold
echo 2. Set memory usage threshold
echo 3. Set disk usage threshold
echo 4. Set network usage threshold
echo 5. Exit
echo.

:: Get user input
set /p choice=Enter your choice: 

:: Process user input
if %choice%==1 goto set_cpu
if %choice%==2 goto set_memory
if %choice%==3 goto set_disk
if %choice%==4 goto set_network
if %choice%==5 goto end

:: Invalid input
echo Invalid choice, please try again.
goto menu

:: Set CPU usage threshold
:set_cpu
set /p cpu_threshold=Enter CPU usage threshold (in percentage): 
echo CPU usage threshold set to %cpu_threshold% percent
echo CPU_THRESHOLD=%cpu_threshold% > settings.txt
goto menu

:: Set memory usage threshold
:set_memory
set /p memory_threshold=Enter memory usage threshold (in MB): 
echo Memory usage threshold set to %memory_threshold% MB
echo MEMORY_THRESHOLD=%memory_threshold% >> settings.txt
goto menu

:: Set disk usage threshold
:set_disk
set /p disk_threshold=Enter disk usage threshold (in percentage): 
echo Disk usage threshold set to %disk_threshold% percent
echo DISK_THRESHOLD=%disk_threshold% >> settings.txt
goto menu

:: Set network usage threshold
:set_network
set /p network_threshold=Enter network usage threshold (in Bytes/sec): 
echo Network usage threshold set to %network_threshold% Bytes/sec
echo NETWORK_THRESHOLD=%network_threshold% >> settings.txt
goto menu

:: End of script
:end
echo Settings saved successfully!
echo Run 'start_monitoring.bat' to start monitoring with the new settings.
echo.

pause

