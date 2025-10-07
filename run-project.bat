@echo off
echo ========================================
echo    Starting Samadhan AI Project
echo ========================================

echo.
echo [1/3] Checking dependencies...

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed or not in PATH
    echo Please install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python from https://python.org/
    pause
    exit /b 1
)

echo Dependencies OK!

echo.
echo [2/3] Starting Backend Server...
start "Samadhan AI Backend" cmd /k "cd /d \"%~dp0flask-backend\" && echo Starting Flask Backend... && python app.py"

echo.
echo Waiting 5 seconds for backend to initialize...
timeout /t 5 /nobreak >nul

echo.
echo [3/3] Starting Frontend Development Server...
start "Samadhan AI Frontend" cmd /k "cd /d \"%~dp0\" && echo Starting React Frontend... && npm run dev"

echo.
echo ========================================
echo    Samadhan AI is starting up!
echo ========================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:5173
echo.
echo Both services are running in separate windows.
echo Close this window when you're done.
echo.
pause