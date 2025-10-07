@echo off
echo Starting Samadhan AI Project...

echo.
echo Starting Backend...
start "Backend" cmd /k "cd /d \"c:\Users\hp\Desktop\IBM Hack\Samadhan-AI-main\flask-backend\" && python app.py"

echo.
echo Waiting 5 seconds for backend to start...
timeout /t 5 /nobreak >nul

echo.
echo Starting Frontend...
start "Frontend" cmd /k "cd /d \"c:\Users\hp\Desktop\IBM Hack\Samadhan-AI-main\" && npm run dev"

echo.
echo Both services are starting...
echo Backend: http://localhost:5000
echo Frontend: http://localhost:5173
pause