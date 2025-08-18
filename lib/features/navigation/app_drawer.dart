import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'App Test Template',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          _buildDrawerItem(
            context,
            icon: Icons.home,
            title: 'Home',
            route: AppRoutes.home,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person_add,
            title: 'User Info',
            route: AppRoutes.userInfo,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.person,
            title: 'Profile',
            route: AppRoutes.profile,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.settings,
            title: 'Settings',
            route: AppRoutes.settings,
          ),
          _buildDrawerItem(
            context,
            icon: Icons.info,
            title: 'About',
            route: AppRoutes.about,
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    BuildContext context, {
      required IconData icon,
      required String title,
      required String route,
    }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.of(context).pushNamed(route); // Navigate to page
      },
    );
  }
}