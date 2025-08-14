# flutter_app_test

A Flutter template workspace for development and testing with organized navigation and clean architecture.

## About This Project

This project serves as a comprehensive template workspace for Flutter app development. It provides a well-structured starting point with navigation system, form handling, and clean architecture that can be used to quickly bootstrap new Flutter applications.

## Current Features

- **Navigation System**: Bottom navigation bar with 5 main sections
- **Feature-based Architecture**: Organized code structure following clean architecture principles
- **User Information Form**: Complete form with validation and dialog popup
- **Material Design 3**: Modern theming with consistent design language
- **Cross-platform Support**: Android, iOS, Web, Windows, macOS, Linux
- **Navigation Components**: App drawer, bottom navigation, and programmatic routing
- **Widget Testing**: Comprehensive test setup with form validation tests
- **Template Structure**: Ready-to-use foundation for any Flutter project

## Getting Started

This template workspace is ready for Flutter development. To use it:

### Prerequisites
- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Your preferred IDE (VS Code, Android Studio, IntelliJ)

### Setup
1. Clone or download this template
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app
4. Begin customizing for your specific project needs

### Development Commands
```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Build for production
flutter build apk        # Android
flutter build ios        # iOS
flutter build web        # Web
flutter build windows    # Windows
```

## Project Structure

```
lib/
├── main.dart                    # Main application entry point
├── app.dart                     # App configuration and routing
└── features/                    # Feature-based organization
    ├── navigation/              # Navigation components
    │   ├── main_navigation.dart # Bottom navigation bar
    │   ├── app_drawer.dart      # Navigation drawer
    │   └── main_scaffold.dart   # Reusable scaffold template
    ├── routes/                  # App routing configuration
    │   └── app_routes.dart      # Route definitions
    └── user_info/               # User information feature
        ├── pages/               # Feature pages
        │   ├── home_page.dart
        │   ├── user_info_page.dart
        │   ├── profile_page.dart
        │   ├── settings_page.dart
        │   └── about_page.dart
        └── widgets/             # Feature widgets
            ├── user_info_form.dart
            └── user_info_dialog.dart

test/
├── widget_test.dart             # Widget tests
└── [your tests]                 # Add additional tests here
```

## Navigation Structure

The app includes multiple navigation patterns:

- **Bottom Navigation**: 5-tab navigation for main app sections
- **App Drawer**: Comprehensive side menu with all available pages
- **Programmatic Navigation**: Named routes for flexible page transitions
- **AppBar Actions**: Quick access buttons and overflow menu

## Features Overview

### Home Page
- Welcome screen with quick action buttons
- Navigation to all main app sections

### User Information Form
- Input validation for name, age, and job fields
- Dialog popup displaying entered information
- Form clearing functionality

### Profile Page
- User profile display template
- Ready for customization with actual user data

### Settings Page
- Settings menu with expandable options
- Template for app configuration

### About Page
- App information and feature list
- Version and description display

## Customization

This template provides a solid foundation with:

- **Feature-based Architecture**: Add new features by creating folders under `features/`
- **Navigation System**: Easily add new pages to bottom navigation or drawer
- **Form Handling**: Complete form validation examples to build upon
- **Material Design 3**: Modern theming with customizable color schemes
- **Cross-platform Build**: Ready for deployment to all Flutter-supported platforms
- **Testing Framework**: Widget test examples for form validation and navigation

### Adding New Features

1. Create a new folder under `features/` for your feature
2. Follow the existing structure: `pages/`, `widgets/`, `models/`, etc.
3. Add routes to `app_routes.dart` if needed
4. Update navigation components to include new pages

### Customizing Navigation

- **Bottom Navigation**: Edit `main_navigation.dart` to add/modify tabs
- **Drawer Menu**: Modify `app_drawer.dart` to add new menu items
- **Routes**: Update `app_routes.dart` for new page routes

Feel free to modify the structure, add new features, or completely rebuild according to your project requirements.

## Flutter Resources

If this is your first Flutter project, here are some helpful resources:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/) - tutorials, samples, and API reference

## Development Notes

- Uses `IndexedStack` in bottom navigation to preserve page state
- Implements clean separation between navigation and business logic
- Ready for state management solutions (Provider, Riverpod, Bloc, etc.)
- Prepared for API integration and data persistence
- Follows Flutter best practices for scalable app development

## License

This template is provided as-is for development purposes. Modify and use according to your project needs.
