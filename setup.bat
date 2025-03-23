@echo off
echo Setting up AquaVerde App...
echo.

REM Check if Flutter is installed
where flutter >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Flutter is not installed. Please install Flutter first.
    echo Visit: https://flutter.dev/docs/get-started/install
    exit /b 1
)

REM Check Flutter version
echo Checking Flutter version...
flutter --version

REM Get dependencies
echo.
echo Installing dependencies...
flutter pub get

REM Create necessary directories if they don't exist
echo.
echo Setting up project structure...
if not exist "assets\images" mkdir assets\images
if not exist "assets\fonts\Poppins" mkdir assets\fonts\Poppins

REM Notify about Poppins font
if not exist "assets\fonts\Poppins\Poppins-Regular.ttf" (
    echo.
    echo Please download Poppins font files manually and place them in assets\fonts\Poppins\
)

REM Run Flutter doctor
echo.
echo Running Flutter doctor...
flutter doctor

REM Build the app
echo.
echo Building the app...
flutter build apk --debug

echo.
echo Setup complete!
echo To run the app, use: flutter run
echo To run tests, use: flutter test
echo.
echo Make sure to:
echo 1. Add your Google Fonts API key in pubspec.yaml if needed
echo 2. Configure Firebase if you plan to use it
echo 3. Update the app icons in assets/images/
echo.
echo Happy coding!
pause