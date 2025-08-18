import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HamburgerMenu extends StatelessWidget {
  const HamburgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Using User accounts drawer header
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.deepPurpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
              backgroundColor: Colors.white,
            ),
            accountName: const Text(
              'UserName',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: const Text(
              'UserName@example.com',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            // onDetailsPressed: () {
            //   // Optional: Add action when header is tapped
            // },
          ),

          // Menu items
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8),
              children: [
                _buildMenuItem(
                  context,
                  icon: Icons.person,
                  title: 'Profile',
                  route: AppRoutes.profile,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.settings,
                  title: 'Settings',
                  route: AppRoutes.settings,
                ),
                _buildMenuItem(
                  context,
                  icon: Icons.info,
                  title: 'About',
                  route: AppRoutes.about,
                ),
              ],
            ),
          ),

          // Footer Section
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text(
              'Version 0.0.1',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          )
        ]
      ),
    );
  }

  /// Helper method to build a menu item
  Widget _buildMenuItem(
    BuildContext context, {
      required IconData icon,
      required String title,
      required String route,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}
