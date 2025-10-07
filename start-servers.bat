@echo off
echo Starting Samadhan AI Project...

echo.
echo [1/2] Starting Backend Server...
start "Samadhan Backend" cmd /k "cd /d "%~dp0flask-backend" && python working_app.py"

echo.
echo Waiting 5 seconds for backend to initialize...
timeout /t 5 /nobreak >nul

echo.
echo [2/2] Starting Frontend Server...
start "Samadhan Frontend" cmd /k "cd /d "%~dp0" && npm run dev"

echo.
echo ========================================
echo    Samadhan AI is now running!
echo ========================================
echo.
echo Backend:  http://localhost:5000
echo Frontend: http://localhost:5173
echo.
echo Both servers are running in separate windows.
echo You can close this window now.
echo.
pause