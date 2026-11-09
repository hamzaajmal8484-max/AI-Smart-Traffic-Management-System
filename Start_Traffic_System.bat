@echo off
cd /d "C:\Users\Hamza Ajmal"

netstat -ano | findstr ":8501" | findstr "LISTENING" >nul

if %errorlevel% neq 0 (
    start "Traffic Server" /min cmd /c "py -3.10 -m streamlit run app.py --server.port 8501"
)

timeout /t 5 /nobreak >nul
start "" "http://localhost:8501"