import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            _buildNavigationButton(
              context,
              'User Information Form',
              AppRoutes.userInfo,
              Icons.person_add,
              Colors.blue,
            ),
            const SizedBox(height: 16),

            _buildNavigationButton(
              context,
              'Profile',
              AppRoutes.profile,
              Icons.account_circle,
              Colors.green,
            ),
            const SizedBox(height: 16),

            _buildNavigationButton(
              context,
              'Settings',
              AppRoutes.settings,
              Icons.settings,
              Colors.orange,
            ),
            const SizedBox(height: 16),

            _buildNavigationButton(
              context,
              'About',
              AppRoutes.about,
              Icons.info,
              Colors.purple,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
  Widget _buildNavigationButton(
    BuildContext context,
    String title,
    String route,
    IconData icon,
    Color color
  ) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          textStyle: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}