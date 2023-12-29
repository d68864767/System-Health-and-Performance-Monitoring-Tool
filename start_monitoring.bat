
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

:: Start monitoring CPU, memory, disk, and network usage
echo Starting system monitoring...

:: Monitor CPU usage
echo Monitoring CPU usage...
typeperf "\Processor(_Total)\% Processor Time" -sc 1 >> logs\performance.log

:: Monitor memory usage
echo Monitoring memory usage...
typeperf "\Memory\Available MBytes" -sc 1 >> logs\performance.log

:: Monitor disk usage
echo Monitoring disk usage...
typeperf "\LogicalDisk(_Total)\% Free Space" -sc 1 >> logs\performance.log

:: Monitor network usage
echo Monitoring network usage...
typeperf "\Network Interface(_Total)\Bytes Total/sec" -sc 1 >> logs\performance.log

echo.
echo System monitoring started successfully!
echo You can view the logs in the 'logs' directory.
echo Run 'view_reports.bat' to view detailed reports.
echo.

pause

