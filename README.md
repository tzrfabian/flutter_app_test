# flutter_app_test

A comprehensive Flutter template workspace with navigation, product management, and push notifications.

## 📋 Table of Contents

1. [About This Project](#about-this-project)
2. [🚀 Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Quick Setup](#quick-setup)
   - [Development Commands](#development-commands)
3. [📁 Project Structure](#project-structure)
4. [✨ Features Overview](#features-overview)
   - [Navigation System](#navigation-system)
   - [Product Management](#product-management)
   - [Push Notifications](#push-notifications)
   - [UI Components](#ui-components)
5. [🛠️ Technical Implementation](#technical-implementation)
6. [🎨 Customization Guide](#customization-guide)
7. [📱 Firebase Setup](#firebase-setup)
8. [🔧 Development Notes](#development-notes)
9. [📚 Resources](#resources)

---

## About This Project

This project serves as a **beginner-friendly Flutter template** that demonstrates modern app development practices. It includes:

- **Clean Architecture**: Well-organized code structure
- **Navigation Systems**: Multiple navigation patterns
- **Product Management**: Complete e-commerce-style components
- **Push Notifications**: Firebase Cloud Messaging integration
- **Material Design 3**: Modern UI/UX patterns
- **Cross-platform Support**: Works on all Flutter platforms

**Perfect for**: Learning Flutter, starting new projects, or understanding best practices.

---

## Getting Started

### Prerequisites

Before you start, make sure you have:

- **Flutter SDK** (3.8.1 or higher) - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK** (included with Flutter)
- **IDE**: VS Code, Android Studio, or IntelliJ
- **Firebase Account** (for push notifications) - [Firebase Console](https://console.firebase.google.com/)

### Quick Setup

1. **Clone or download** this template
2. **Install dependencies**:
   ```bash
   flutter pub get
   ```
3. **Run the app**:
   ```bash
   flutter run
   ```
4. **Start customizing** for your project needs!

### Development Commands

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Run tests
flutter test

# Clean build files
flutter clean

# Build for production
flutter build apk        # Android
flutter build ios        # iOS  
flutter build web        # Web
flutter build windows    # Windows
```

---

## 📁 Project Structure

```
lib/
├── main.dart                      # 🏠 App entry point & Firebase initialization
├── app.dart                       # ⚙️ App configuration and routing
├── api/                           # 🔥 Firebase and API services
│   └── firebase_api.dart          # Firebase Cloud Messaging setup
├── models/                        # 📊 Data models
│   ├── models.dart                # Barrel export for models
│   └── product.dart               # Product data model
├── sample/                        # 🗃️ Sample data
│   ├── img_carousel_data.dart     # Image carousel JSON data
│   └── product_sample_data.dart   # Product showcase JSON data
└── features/                      # 🎯 Feature-based organization
    ├── navigation/                # 🧭 Navigation components
    │   └── main_navigation.dart   # Bottom navigation bar
    ├── routes/                    # 🗺️ App routing
    │   └── app_routes.dart        # Route definitions
    ├── pages/                     # 📄 Application screens
    │   ├── home_page.dart         # Home with slider & products
    │   ├── products_page.dart     # Products with search & filter
    │   ├── user_info_page.dart    # User information form
    │   ├── profile_page.dart      # User profile
    │   ├── settings_page.dart     # App settings
    │   └── about_page.dart        # About information
    └── widgets/                   # 🧩 Reusable components
        ├── hamburger_menu.dart    # Navigation drawer
        ├── image_slider.dart      # Auto-sliding carousel
        ├── featured_product_list.dart # Horizontal product showcase
        ├── product_card_list.dart # Grid/list product cards
        ├── product_detail_dialog.dart # Product detail modal
        ├── user_info_form.dart    # User form widget
        └── user_info_dialog.dart  # User info display

android/
├── app/
│   ├── google-services.json       # 🔥 Firebase configuration
│   └── src/main/AndroidManifest.xml # Android permissions
```

---

## ✨ Features Overview

### Navigation System

The app demonstrates **multiple navigation patterns**:

- **🏠 Bottom Navigation**: 5-tab navigation for main sections
- **🍔 Hamburger Menu**: Side drawer with gradient header
- **🔗 Programmatic Navigation**: Named routes for flexible transitions
- **📱 Global Navigation**: Works from anywhere using `navigatorKey`

### Product Management

Complete **e-commerce-style** product system:

#### 🛍️ Products Page
- **Grid View**: 2-column responsive layout
- **🔍 Real-time Search**: Search by name or category
- **🏷️ Category Filtering**: Dynamic filter chips
- **📊 Statistics**: Product count and total price
- **❌ Empty States**: Helpful no-results messages

#### 🎴 Product Cards
- **Flexible Display**: Grid and list view support
- **🖼️ Image Loading**: Network images with loading states
- **⭐ Ratings**: Star ratings and pricing
- **👆 Tap Actions**: View details or custom actions

#### 🔍 Product Details
- **📷 Large Images**: Full-size product photos  
- **📝 Detailed Info**: Category, rating, price display
- **🛒 Add to Cart**: Interactive cart functionality
- **📱 Responsive**: Proper constraints for all screens

### Push Notifications

**Firebase Cloud Messaging** integration:

#### 🔔 Notification Types
- **Foreground**: In-app notifications while using the app
- **Background**: System notifications when app is minimized
- **📲 Tap Navigation**: Dynamic routing based on notification content

#### 🎯 Dynamic Routing
- **Route by Keywords**: Analyzes notification title/body
- **Smart Navigation**: Routes to relevant pages automatically
- **🔄 Fallback Logic**: Defaults to home if no match found

**Example routing keywords**:
- `product` → Products Page
- `profile` → Profile Page  
- `settings` → Settings Page

#### ⏰ Scheduled Notifications
- **Local Scheduling**: Schedule notifications within the app
- **⚡ Exact Alarms**: Precise timing on Android 13+
- **🔋 Battery Optimization**: Handles device restrictions

### UI Components

#### 🎠 Image Slider
- **⏯️ Auto-sliding**: Changes slides every 5 seconds
- **👆 Manual Control**: Swipe gestures and arrow buttons
- **🔵 Page Indicators**: Animated dots show current slide
- **🗃️ JSON Integration**: Loads from structured data

#### 📝 User Forms
- **✅ Validation**: Input validation with error messages
- **💬 Dialog Display**: Shows entered information
- **🧹 Form Clearing**: Reset functionality

---

## 🛠️ Technical Implementation

### 🏗️ Architecture Patterns

- **📁 Feature-based Organization**: Code grouped by functionality
- **🎯 Single Responsibility**: Each component has one clear purpose
- **🔄 Separation of Concerns**: UI, logic, and data are separated
- **📦 Barrel Exports**: Clean imports with `models.dart`

### 🔥 Firebase Integration

#### Push Notifications Setup
```dart
// 1. Initialize Firebase
await Firebase.initializeApp();

// 2. Setup notifications
await FirebaseApi().initNotifications();

// 3. Handle incoming messages
FirebaseMessaging.onMessage.listen((message) {
  // Show notification while app is open
});

// 4. Handle notification taps
void handleNotif(RemoteMessage? message) {
  // Dynamic routing based on content
}
```

#### 📱 Android Configuration
- **📋 Permissions**: Notification and exact alarm permissions
- **🔔 Notification Channels**: Proper Android notification setup
- **🔋 Battery Optimization**: Handles device power management

### 🎨 Material Design 3
- **🎨 Modern Theming**: Latest Material Design components
- **📱 Responsive Layout**: Adapts to different screen sizes
- **♿ Accessibility**: Proper semantic labels and navigation
- **🌙 Dark Mode Ready**: Theme structure supports dark themes

---

## Customization Guide

### 🆕 Adding New Features

1. **Create Feature Folder**:
   ```
   lib/features/your_feature/
   ├── pages/
   ├── widgets/
   └── data/
   ```

2. **Add Routes**:
   ```dart
   // In app_routes.dart
   static const yourFeature = '/your-feature';
   ```

3. **Update Navigation**:
   ```dart
   // Add to bottom navigation or drawer
   ```

### 🎛️ Customizing Products

**Add New Product Properties**:
```dart
// In models/product.dart
class Product {
  final String description;  // Add new field
  final List<String> images; // Multiple images
  // ... existing fields
}
```

**Modify Product Cards**:
- Edit `product_card_list.dart` for layout changes
- Update `product_detail_dialog.dart` for detail view
- Customize search logic in `products_page.dart`

### 🔔 Notification Customization

**Add New Route Keywords**:
```dart
// In firebase_api.dart handleNotif method
if (title.contains('orders') || body.contains('orders')) {
  route = '/orders';
} else if (title.contains('cart') || body.contains('cart')) {
  route = '/cart';
}
```

**Custom Notification Channels**:
```dart
// Create different channels for different notification types
const urgentChannel = AndroidNotificationChannel(
  'urgent_channel',
  'Urgent Notifications',
  importance: Importance.high,
);
```

### 🎠 Image Slider Customization

**Change Auto-slide Timing**:
```dart
// In image_slider.dart
Future.delayed(const Duration(seconds: 3), () {
  // Change from 5 to 3 seconds
});
```

**Add Custom Transitions**:
```dart
PageView.builder(
  physics: const BouncingScrollPhysics(), // Custom physics
  // ... other properties
);
```

---

## Firebase Setup

### 🔥 Initial Setup

1. **Create Firebase Project**:
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create new project
   - Enable Cloud Messaging

2. **Android Setup**:
   ```bash
   # Download google-services.json
   # Place in android/app/
   ```

3. **Add Dependencies**:
   ```yaml
   dependencies:
     firebase_core: ^2.24.2
     firebase_messaging: ^14.7.10
     flutter_local_notifications: ^16.3.2
   ```

### 📲 Testing Push Notifications

1. **Get FCM Token**:
   - Run app and check console for token
   - Copy the long token string

2. **Send Test Message**:
   - Go to Firebase Console → Cloud Messaging
   - Click "Send your first message"
   - Enter title and body
   - Select "Single device" and paste token

3. **Test Routing**:
   - Use keywords like "product", "profile", "settings" in title/body
   - App will navigate to appropriate page when tapped

### 🔧 Common Issues

**Notifications not appearing?**
- Check app is running (not killed)
- Verify device notification permissions
- Test on different devices
- Check battery optimization settings

**Navigation not working?**
- Ensure routes are registered in `app.dart`
- Check `navigatorKey` is set in `MaterialApp`
- Verify route names match exactly

---

## 🔧 Development Notes

### 📱 Platform Support
- **✅ Android**: Full feature support
- **✅ iOS**: Full feature support  
- **✅ Web**: Basic functionality (no push notifications)
- **✅ Windows/macOS/Linux**: UI only

### 🚀 Performance Tips
- Uses `IndexedStack` to preserve page state
- Lazy loading with `ListView.builder` for large lists
- Network image caching for better performance
- Proper async/await for smooth UI

### 🧪 Testing
- Widget tests for form validation
- Navigation testing examples
- Firebase integration can be mocked for testing

### 🔮 Future Enhancements
- State management (Provider, Riverpod, Bloc)
- API integration for real data
- User authentication
- Local database (SQLite, Hive)
- Advanced animations and transitions

---

## 📚 Resources

### 📖 Learning Flutter
- [Flutter Documentation](https://docs.flutter.dev/) - Official docs
- [Flutter Cookbook](https://docs.flutter.dev/cookbook) - Code examples
- [Dart Language Tour](https://dart.dev/guides/language/language-tour) - Learn Dart

### 🔥 Firebase Resources  
- [Firebase Documentation](https://firebase.google.com/docs) - Complete guides
- [FCM Documentation](https://firebase.google.com/docs/cloud-messaging) - Push notifications
- [Firebase Console](https://console.firebase.google.com/) - Project management

### 📱 Material Design
- [Material Design 3](https://m3.material.io/) - Design system
- [Flutter Material Components](https://docs.flutter.dev/ui/widgets/material) - Widgets

---

## 📄 License

This template is provided as-is for educational and development purposes. Feel free to modify and use according to your project needs.

---

**Happy Coding! 🚀**

## License

This template is provided as-is for development purposes. Modify and use according to your project needs.
