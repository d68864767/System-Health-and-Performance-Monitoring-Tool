
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

:: Create necessary directories
if not exist "logs" (
    mkdir logs
    echo Created directory: logs
)

if not exist "reports" (
    mkdir reports
    echo Created directory: reports
)

:: Create necessary files
if not exist "logs\performance.log" (
    type nul > logs\performance.log
    echo Created file: logs\performance.log
)

if not exist "reports\performance_report.txt" (
    type nul > reports\performance_report.txt
    echo Created file: reports\performance_report.txt
)

echo.
echo Installation completed successfully!
echo You can now use the System Health and Performance Monitoring Tool.
echo Run 'start_monitoring.bat' to start monitoring.
echo.

pause

