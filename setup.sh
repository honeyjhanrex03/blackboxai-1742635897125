#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Setting up AquaVerde App...${NC}\n"

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo -e "${RED}Flutter is not installed. Please install Flutter first.${NC}"
    echo "Visit: https://flutter.dev/docs/get-started/install"
    exit 1
fi

# Check Flutter version
echo -e "${BLUE}Checking Flutter version...${NC}"
flutter --version

# Get dependencies
echo -e "\n${BLUE}Installing dependencies...${NC}"
flutter pub get

# Create necessary directories if they don't exist
echo -e "\n${BLUE}Setting up project structure...${NC}"
mkdir -p assets/images
mkdir -p assets/fonts/Poppins

# Download Poppins font if not exists
if [ ! -f "assets/fonts/Poppins/Poppins-Regular.ttf" ]; then
    echo -e "\n${BLUE}Downloading Poppins font...${NC}"
    # Note: In a real setup, you would download the font files here
    echo "Please download Poppins font files manually and place them in assets/fonts/Poppins/"
fi

# Run Flutter doctor
echo -e "\n${BLUE}Running Flutter doctor...${NC}"
flutter doctor

# Build the app
echo -e "\n${BLUE}Building the app...${NC}"
flutter build apk --debug

echo -e "\n${GREEN}Setup complete!${NC}"
echo -e "To run the app, use: ${BLUE}flutter run${NC}"
echo -e "To run tests, use: ${BLUE}flutter test${NC}"
echo -e "\nMake sure to:"
echo "1. Add your Google Fonts API key in pubspec.yaml if needed"
echo "2. Configure Firebase if you plan to use it"
echo "3. Update the app icons in assets/images/"
echo -e "\n${GREEN}Happy coding!${NC}"