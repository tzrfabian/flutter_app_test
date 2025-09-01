# flutter_app_test

A Flutter template workspace for development and testing with organized navigation and clean architecture.

## About This Project

This project serves as a comprehensive template workspace for Flutter app development. It provides a well-structured starting point with navigation system, form handling, and clean architecture that can be used to quickly bootstrap new Flutter applications.

## Current Features

- **Navigation System**: Bottom navigation bar with 5 main sections
- **Feature-based Architecture**: Organized code structure with separated concerns
- **Data Models**: Centralized Product model with clean separation
- **Hamburger Menu**: Navigation drawer with gradient header and menu items
- **Image Slider Component**: Auto-sliding carousel with manual navigation and indicators
- **Product Management**: Comprehensive product listing, search, and filtering
- **Product Card Components**: Reusable product cards with grid and list view options
- **Product Detail Dialog**: Enhanced modal with detailed product information
- **Featured Product List**: Horizontal scrolling product showcase with interactive cards
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
├── main.dart                      # Main application entry point
├── app.dart                       # App configuration and routing
├── models/                        # Data models
│   ├── models.dart                # Barrel export for models
│   └── product.dart               # Product data model
├── sample/                        # Sample data and configurations
│   ├── img_carousel_data.dart     # JSON data for image carousel
│   └── product_sample_data.dart   # JSON data for product showcase
└── features/                      # Feature-based organization
    ├── navigation/                # Navigation components
    │   └── main_navigation.dart   # Bottom navigation bar
    ├── routes/                    # App routing configuration
    │   └── app_routes.dart        # Route definitions
    ├── pages/                     # Application pages
    │   ├── home_page.dart         # Home page with image slider & product list
    │   ├── products_page.dart     # Products page with search and filtering
    │   ├── user_info_page.dart    # User information form page
    │   ├── profile_page.dart      # User profile page
    │   ├── settings_page.dart     # Settings page
    │   └── about_page.dart        # About page
    └── widgets/                   # Reusable widgets
        ├── hamburger_menu.dart    # Navigation drawer/hamburger menu
        ├── image_slider.dart      # Auto-sliding image carousel
        ├── featured_product_list.dart # Horizontal featured product list
        ├── product_card_list.dart # Reusable product card grid/list widget
        ├── product_detail_dialog.dart # Product detail modal dialog
        ├── user_info_form.dart    # User information form widget
        └── user_info_dialog.dart  # User info display dialog

test/
├── widget_test.dart               # Widget tests
└── [your tests]                   # Add additional tests here
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
- Horizontal featured product list with interactive product cards
- Quick action buttons for navigation to main sections

### Products Page
- **Comprehensive Product Listing**: Grid view of all products with search and filtering
- **Real-time Search**: Search products by name or category with instant results
- **Category Filtering**: Dynamic category chips for easy product filtering
- **Product Count & Total**: Display of filtered product count and total price
- **Empty State Handling**: Helpful messages when no products match filters
- **Responsive Grid Layout**: 2-column grid optimized for mobile viewing

### Product Components

#### Product Card List Widget
- **Flexible Display**: Supports both grid and list view layouts
- **Reusable Component**: Can be used across different pages and contexts
- **Interactive Cards**: Tap to view detailed product information
- **Loading States**: Proper loading indicators and error handling
- **Consistent Styling**: Material Design cards with elevation and rounded corners

#### Product Detail Dialog
- **Comprehensive Product View**: Large product image with detailed information
- **Enhanced Layout**: Organized display of category, rating, and price
- **Interactive Elements**: Add to Cart functionality with user feedback
- **Icon-based Information**: Clear visual hierarchy with descriptive icons
- **Responsive Design**: Proper constraints for different screen sizes

#### Featured Product List
- **Horizontal Scrolling**: Smooth swipe navigation through featured products
- **Limited Selection**: Showcases top 5 products on home page
- **Quick Access**: Direct navigation to product details from home

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
- **Product List**: Horizontal scrolling showcase with interactive product cards
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

### Customizing Product Components

- **Product Model**: Modify `models/product.dart` to add new properties
- **Product Cards**: Update `product_card_list.dart` for different layouts or styling
- **Product Details**: Customize `product_detail_dialog.dart` for enhanced product information
- **Search & Filter**: Extend filtering logic in `products_page.dart` for advanced criteria
- **Featured Products**: Adjust selection logic in `featured_product_list.dart`
- **Data Source**: Replace static data with API calls or database integration

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
- **Product List**: Horizontal `ListView.builder` with custom card widgets
- **JSON Mapping**: Demonstrates `fromJson()` factory constructors for type safety
- **Auto-sliding**: Uses `Future.delayed()` with `mounted` check for memory safety
- **Error Handling**: Comprehensive error states for network images and data loading
- **Dialog Constraints**: Proper layout constraints to prevent rendering issues
- Ready for state management solutions (Provider, Riverpod, Bloc, etc.)
- Prepared for API integration and data persistence
- Follows Flutter best practices for scalable app development

## Technical Implementation

### Data Models Architecture
- **Centralized Models**: Product model in dedicated `models/` directory
- **Barrel Exports**: Clean imports using `models.dart` barrel file
- **Simple Data Structures**: Focused models without unnecessary complexity
- **Type Safety**: Proper typing for all product properties

### Product Management System
- **Reusable Components**: Product cards can be used in grid or list layouts
- **Search & Filter Logic**: Real-time filtering with category and text search
- **State Management**: Proper state handling for search queries and filtered results
- **Dynamic Categories**: Auto-generated category filters from product data

### Product Card Architecture
- **Flexible Layout**: Single component supports both grid and list views
- **Tap Handling**: Configurable tap actions with fallback to detail dialog
- **Image Optimization**: Network image loading with proper error states
- **Material Design**: Consistent elevation, shadows, and border radius

### Product Detail Dialog
- **Modal Presentation**: Full-screen dialog with scrollable content
- **Enhanced UX**: Icon-based information display with proper visual hierarchy
- **Action Integration**: Add to Cart with snackbar feedback
- **Static Helper Method**: Easy dialog presentation with `ProductDetailDialog.show()`

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
