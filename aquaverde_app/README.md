# AquaVerde - Smart Fish Feeding App

AquaVerde is a Flutter application that helps users manage and automate their fish feeding schedules using BLOOP devices. The app provides an intuitive interface for monitoring fish tanks, setting up feeding schedules, and tracking feeding history.

## Features

- 🔐 User Authentication (Login/Signup)
- 📱 Modern, Responsive UI
- 🐟 Device Management
- ⏰ Feeding Schedule Management
- 📊 Activity Tracking & Analytics
- 🌙 Dark Mode Support
- 👤 Profile Management
- 🔔 Push Notifications
- 📈 Feeding Statistics

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Android SDK / Xcode (for iOS development)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/aquaverde_app.git
cd aquaverde_app
```

2. Run the setup script:
- For Windows:
```bash
setup.bat
```
- For macOS/Linux:
```bash
chmod +x setup.sh
./setup.sh
```

3. Run the app:
```bash
flutter run
```

### Project Structure

```
aquaverde_app/
├── lib/
│   ├── config/           # App configuration and constants
│   ├── providers/        # State management
│   ├── screens/          # App screens
│   ├── widgets/          # Reusable widgets
│   ├── utils/           # Helper functions and utilities
│   └── main.dart        # App entry point
├── assets/
│   ├── images/          # App images and icons
│   └── fonts/           # Custom fonts
└── test/               # Unit and widget tests
```

## Screens

1. **Splash Screen**: App loading and initialization
2. **Welcome Screen**: User onboarding
3. **Login/Signup Screens**: User authentication
4. **Home Screen**: Dashboard with device overview
5. **Device Management**: BLOOP device control
6. **Feeding Schedule**: Schedule management
7. **Activity Logs**: Feeding history and analytics
8. **Settings**: App configuration
9. **Profile**: User profile management

## Widgets

- `CustomAppBar`: Consistent app navigation
- `CustomBottomNav`: Bottom navigation bar
- `DeviceCard`: Device information display
- `ScheduleCard`: Feeding schedule management
- `FeedingChart`: Analytics visualization
- `CustomDialog`: Modal dialogs
- `PrimaryButton`: Styled buttons
- `SocialLoginButton`: Social authentication buttons

## State Management

The app uses Provider for state management. The main state is managed through `AppState` class, which handles:

- User authentication state
- Device management
- Theme preferences
- App settings

## Styling

- Uses Material Design with custom theming
- Consistent color scheme defined in `AppTheme`
- Custom fonts (Poppins)
- Responsive layouts
- Dark mode support

## Development

### Code Style

Follow the official [Dart style guide](https://dart.dev/guides/language/effective-dart/style) and [Flutter style guide](https://github.com/flutter/flutter/wiki/Style-guide-for-Flutter-repo).

### Running Tests

```bash
flutter test
```

### Building for Production

Android:
```bash
flutter build apk --release
```

iOS:
```bash
flutter build ios --release
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter](https://flutter.dev/)
- [Provider](https://pub.dev/packages/provider)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Font Awesome](https://fontawesome.com/)

## Support

For support, email support@aquaverde.com or join our Slack channel.

## Screenshots

[Add screenshots of your app here]

## Roadmap

- [ ] Add support for multiple languages
- [ ] Implement real-time device monitoring
- [ ] Add water quality monitoring
- [ ] Integrate with smart home systems
- [ ] Add fish species database
- [ ] Implement AI-powered feeding recommendations

---

Made with ❤️ by [Your Name/Team]