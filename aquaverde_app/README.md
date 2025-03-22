# AquaVerde App

AquaVerde is a smart fish feeding application that helps users manage and automate their fish feeding schedules using BLOOP devices.

## Features

- User Authentication (Login/Signup)
- Device Management
- Feeding Schedule Management
- Real-time Device Status Monitoring
- Automated Feeding System
- User Profile Management

## Project Structure

```
aquaverde_app/
├── lib/
│   ├── config/
│   │   ├── constants.dart
│   │   └── theme.dart
│   ├── screens/
│   │   ├── splash_screen.dart
│   │   ├── welcome_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── home_screen.dart
│   │   ├── devices_screen.dart
│   │   └── device_detail_screen.dart
│   ├── widgets/
│   │   ├── primary_button.dart
│   │   └── social_login_button.dart
│   ├── utils/
│   │   └── helpers.dart
│   └── main.dart
├── assets/
│   ├── images/
│   │   ├── logo.png
│   │   ├── facebook.png
│   │   └── google.png
│   └── fonts/
│       └── Poppins/
├── pubspec.yaml
└── README.md
```

## Setup Instructions

1. Ensure you have Flutter installed on your machine
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Create the assets folders:
   ```bash
   mkdir -p assets/images assets/fonts/Poppins
   ```
5. Add required assets to their respective folders
6. Run the app using `flutter run`

## Dependencies

- flutter_svg: For SVG image support
- google_fonts: For custom fonts
- provider: For state management
- shared_preferences: For local storage
- intl: For date formatting

## Design System

The app follows a consistent design system with:

- Primary Color: #6C63FF
- Secondary Color: #00C853
- Font: Poppins
- Border Radius: 16px
- Standard Padding: 24px

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.