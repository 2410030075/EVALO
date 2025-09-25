@echo off
echo Starting Quiz System...
echo.

REM Check if Java is installed
echo Checking if Java is installed...
java -version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
  echo Java is not installed or not in PATH. Please install Java 11 or higher.
  pause
  exit /b
)

REM Check if MySQL is running
echo Checking if MySQL is running...
echo (Note: This might take a few seconds...)
mysqladmin ping -u root -p626629 >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
  echo MySQL does not appear to be running. Please start MySQL service.
  echo You can use the MySQL installer to start the service or run:
  echo net start mysql
  pause
  exit /b
)

REM Create database if not exists
echo Creating database if it doesn't exist...
echo CREATE DATABASE IF NOT EXISTS quiz_system; | mysql -u root -p626629 >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
  echo Failed to create database. Check MySQL connection settings.
  pause
  exit /b
)

echo.
echo Starting backend server...
start "Java Backend" cmd /c "cd java-backend && mvn spring-boot:run"

REM Wait for backend to start
echo Waiting for backend to start (10 seconds)...
timeout /t 10 /nobreak > nul

REM Start frontend HTTP server
echo Starting frontend server...
start "Frontend Server" cmd /c "python -m http.server 8000"

echo.
echo Quiz system is starting...
echo.
echo Frontend: http://localhost:8000
echo Backend API: http://localhost:8080/api/quiz
echo Backend Health: http://localhost:8080/actuator/health
echo.
echo Press any key to close servers when done.
pause

REM Kill servers when done
taskkill /f /im java.exe >nul 2>&1
taskkill /f /im python.exe >nul 2>&1

echo Servers stopped.
pause