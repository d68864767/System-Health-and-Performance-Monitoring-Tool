
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

:: Check if the log file exists
if not exist logs\performance.log (
    echo No performance data found. Please run 'start_monitoring.bat' first.
    pause
    exit /b
)

:: Display the performance data
echo Displaying system performance data...

:: Display CPU usage
echo.
echo CPU Usage:
type logs\performance.log | findstr /c:"\Processor(_Total)\% Processor Time"

:: Display memory usage
echo.
echo Memory Usage:
type logs\performance.log | findstr /c:"\Memory\Available MBytes"

:: Display disk usage
echo.
echo Disk Usage:
type logs\performance.log | findstr /c:"\LogicalDisk(_Total)\% Free Space"

:: Display network usage
echo.
echo Network Usage:
type logs\performance.log | findstr /c:"\Network Interface(_Total)\Bytes Total/sec"

echo.
echo End of report.
echo.

pause

