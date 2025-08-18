# flutter_app_test

A Flutter template workspace for development and testing with organized navigation and clean architecture.

## About This Project

This project serves as a comprehensive template workspace for Flutter app development. It provides a well-structured starting point with navigation system, form handling, and clean architecture that can be used to quickly bootstrap new Flutter applications.

## Current Features

- **Navigation System**: Bottom navigation bar with 5 main sections
- **Feature-based Architecture**: Organized code structure with separated concerns
- **Hamburger Menu**: Navigation drawer with gradient header and menu items
- **Image Slider Component**: Auto-sliding carousel with manual navigation and indicators
- **JSON Data Mapping**: Demonstrates JSON to Dart object conversion with proper error handling
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
├── sample/                      # Sample data and configurations
│   └── img_carousel_data.dart   # JSON data for image carousel
└── features/                    # Feature-based organization
    ├── navigation/              # Navigation components
    │   ├── main_navigation.dart # Bottom navigation bar
    │   ├── app_drawer.dart      # Navigation drawer
    │   └── main_scaffold.dart   # Reusable scaffold template
    ├── routes/                  # App routing configuration
    │   └── app_routes.dart      # Route definitions
    ├── pages/                   # Application pages
    │   ├── home_page.dart       # Home page with image slider
    │   ├── user_info_page.dart  # User information form page
    │   ├── profile_page.dart    # User profile page
    │   ├── settings_page.dart   # Settings page
    │   └── about_page.dart      # About page
    └── widgets/                 # Reusable widgets
        ├── hamburger_menu.dart  # Navigation drawer/hamburger menu
        ├── image_slider.dart    # Auto-sliding image carousel
        ├── user_info_form.dart  # User information form widget
        └── user_info_dialog.dart # User info display dialog

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
- **Hamburger Button**: Access button for opening the drawer/side menu

## Features Overview

### Home Page
- Welcome screen with image slider carousel
- Auto-sliding images with manual navigation controls
- Quick action buttons for navigation to main sections

### Image Slider Component
- **Auto-sliding**: Automatically changes slides every 5 seconds
- **Manual Navigation**: Left/right arrow buttons and swipe gestures
- **Page Indicators**: Animated dots showing current slide position
- **JSON Data Integration**: Loads carousel data from structured JSON
- **Error Handling**: Graceful fallbacks for loading states and errors
- **Responsive Design**: Adapts to different screen sizes

### User Information Form
- Input validation for name, age, and job fields
- Dialog popup displaying entered information
- Form clearing functionality
- Comprehensive validation with error messages

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
- **Image Slider**: Customizable carousel with JSON data support
- **Form Handling**: Complete form validation examples to build upon
- **Material Design 3**: Modern theming with customizable color schemes
- **Cross-platform Build**: Ready for deployment to all Flutter-supported platforms
- **Testing Framework**: Widget test examples for form validation and navigation

### Adding New Features

1. Create new widgets in `features/widgets/` for reusable components
2. Add new pages in `features/pages/` for application screens
3. Update `features/routes/app_routes.dart` to add new routes
4. Update navigation components (`main_navigation.dart`, `hamburger_menu.dart`) to include new pages
5. Follow the existing structure for consistency

### Customizing Image Slider

- **Data Source**: Modify `img_carousel_data.dart` to change slide content
- **Styling**: Update colors, animations, and layout in `image_slider.dart`
- **Auto-slide Timing**: Adjust delay in the `_startAutoSlide()` method
- **External Data**: Replace static data with API calls or asset files

### JSON Data Handling

The template demonstrates three approaches for JSON data:
- **Static Dart Files**: Best for fixed data (current implementation)
- **Asset Files**: For external JSON files bundled with the app
- **API Integration**: Ready for dynamic data from web services

### Customizing Navigation

- **Bottom Navigation**: Edit `features/navigation/main_navigation.dart` to add/modify tabs
- **Hamburger Menu**: Modify `features/widgets/hamburger_menu.dart` to add new menu items
- **App Drawer**: Update `features/navigation/app_drawer.dart` for additional drawer functionality
- **Routes**: Update `features/routes/app_routes.dart` for new page routes

Feel free to modify the structure, add new features, or completely rebuild according to your project requirements.

## Flutter Resources

If this is your first Flutter project, here are some helpful resources:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/) - tutorials, samples, and API reference

## Development Notes

- Uses `IndexedStack` in bottom navigation to preserve page state
- Implements clean separation between navigation and business logic
- **Image Slider**: Built with `PageView` and `PageController` for smooth animations
- **JSON Mapping**: Demonstrates `fromJson()` factory constructors for type safety
- **Auto-sliding**: Uses `Future.delayed()` with `mounted` check for memory safety
- **Error Handling**: Comprehensive error states for network images and data loading
- Ready for state management solutions (Provider, Riverpod, Bloc, etc.)
- Prepared for API integration and data persistence
- Follows Flutter best practices for scalable app development

## Technical Implementation

### Image Slider Features
- **PageController**: Manages slide transitions and animations
- **Auto-slide**: Recursive `Future.delayed()` with lifecycle checks
- **Manual Navigation**: Arrow buttons with smooth `animateToPage()`
- **Indicators**: Dynamic indicator generation with animation
- **Image Loading**: Network images with loading and error states
- **JSON Integration**: Type-safe data mapping with null safety

### Navigation Architecture
- **Bottom Navigation**: `BottomNavigationBar` with `IndexedStack`
- **Named Routes**: Centralized routing with `MaterialApp.routes`
- **Drawer Navigation**: `Drawer` with `ListTile` items
- **State Preservation**: Pages maintain state during navigation

## License

This template is provided as-is for development purposes. Modify and use according to your project needs.
