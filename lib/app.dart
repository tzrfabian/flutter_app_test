import 'package:flutter/material.dart';
import 'package:flutter_app_test/features/navigation/main_navigation.dart';
import 'package:flutter_app_test/features/pages/products_page.dart';
import 'package:flutter_app_test/features/routes/app_routes.dart';
import 'package:flutter_app_test/features/pages/about_page.dart';
// import 'package:flutter_app_test/features/user_info/pages/home_page.dart';
import 'package:flutter_app_test/features/pages/profile_page.dart';
import 'package:flutter_app_test/features/pages/settings_page.dart';
import 'package:flutter_app_test/features/pages/user_info_page.dart';
import 'package:flutter_app_test/main.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Flutter Test Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true, // Enable Material Design 3
      ),
      home: const MainNavigation(), // Entry point
      routes: { // Named route mapping
        // AppRoutes.home: (context) => const HomePage(), // if uncomment will cause routes conflict
        AppRoutes.products: (context) => const ProductsPage(),
        AppRoutes.userInfo: (context) => const UserInfoPage(title: 'User Information Form'),
        AppRoutes.profile: (context) => const ProfilePage(),
        AppRoutes.settings: (context) => const SettingsPage(),
        AppRoutes.about: (context) => const AboutPage(),
      },
    );
  }
}