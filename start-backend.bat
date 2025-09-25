@echo off
echo Starting Quiz System Backend...
echo.
echo Checking if Java is installed...
java -version 2>nul
if %ERRORLEVEL% NEQ 0 (
  echo Java is not installed or not in PATH. Please install Java 11 or higher.
  goto :end
)

echo.
echo Checking if MySQL is running...
tasklist /fi "imagename eq mysqld.exe" | find "mysqld.exe" > nul
if %ERRORLEVEL% NEQ 0 (
  echo MySQL does not appear to be running. Please start MySQL service.
  echo You can use the MySQL installer to start the service or run:
  echo net start mysql
  goto :end
)

echo.
echo Starting Spring Boot application...
cd java-backend
echo Building and starting the application...
call mvnw.cmd spring-boot:run
if %ERRORLEVEL% NEQ 0 (
  echo Failed to start the backend. Please check error messages above.
) else (
  echo Backend started successfully at http://localhost:8080
)

:end
echo.
pause