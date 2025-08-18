
import 'package:flutter/material.dart';
import 'package:flutter_app_test/features/user_info/pages/about_page.dart';
import 'package:flutter_app_test/features/user_info/pages/home_page.dart';
import 'package:flutter_app_test/features/user_info/pages/profile_page.dart';
import 'package:flutter_app_test/features/user_info/pages/settings_page.dart';
import 'package:flutter_app_test/features/user_info/pages/user_info_page.dart';

class MainNavigation extends StatefulWidget{
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0; // Tracks which tab is currently selected

  final List<Widget> _pages = [ // list page for each tab
    const HomePage(),
    const UserInfoPage(title: 'User Information Form'),
    const ProfilePage(),
    const SettingsPage(),
    const AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User Info'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ]
      ),
    );
  }
}