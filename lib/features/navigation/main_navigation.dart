
import 'package:flutter/material.dart';
import 'package:flutter_app_test/features/pages/about_page.dart';
import 'package:flutter_app_test/features/pages/home_page.dart';
import 'package:flutter_app_test/features/pages/products_page.dart';
import 'package:flutter_app_test/features/pages/settings_page.dart';
import 'package:flutter_app_test/features/pages/user_info_page.dart';

class MainNavigation extends StatefulWidget{
  static void Function(int)? tabSwitcher;
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0; // Tracks which tab is currently selected

  final List<Widget> _pages = [ // list page for each tab
    const HomePage(),
    const ProductsPage(),
    const UserInfoPage(title: 'User Information Form'),
    const SettingsPage(),
    const AboutPage(),
  ];

  // for switching tabs
  void switchTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  // for initializing
  @override
  void initState() {
    super.initState();
    MainNavigation.tabSwitcher = switchTab;
  }
  // for disposing
  @override
  void dispose() {
    MainNavigation.tabSwitcher = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => switchTab(index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Products'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User Info'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ]
      ),
    );
  }
}