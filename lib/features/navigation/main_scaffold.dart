import 'package:flutter/material.dart';
import 'app_drawer.dart';
import '../routes/app_routes.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({
    super.key,
    required this.title,
    required this.body,
    this.floatingActionButton,
  });

  final String title;
  final Widget body;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.userInfo),
            tooltip: 'Add User Info',
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.profile),
            tooltip: 'Profile',
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              Navigator.pushNamed(context, value);
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: AppRoutes.settings,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                )
              ),
              const PopupMenuItem(
                value: AppRoutes.about,
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About'),
                ),
              ),
            ],
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}