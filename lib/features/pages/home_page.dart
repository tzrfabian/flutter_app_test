import 'package:flutter/material.dart';
import 'package:flutter_app_test/features/widgets/hamburger_menu.dart';
import 'package:flutter_app_test/features/widgets/image_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.lightBlue,
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       colors: [Colors.lightBlue, Colors.indigoAccent],
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //     ),
        //   ),
        // ),
      ),
      drawer: const HamburgerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Flutter App Template!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),

            const ImageSlider(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Widget _buildQuickActionButton(
  //   BuildContext context,
  //   String label,
  //   IconData icon,
  //   String route,
  // ) {
  //   return Column(
  //     children: [
  //       IconButton(
  //         onPressed: () => Navigator.pushNamed(context, route),
  //         icon: Icon(icon, size: 32),
  //         style: IconButton.styleFrom(
  //           backgroundColor: Theme.of(context).colorScheme.primaryContainer,
  //           padding: const EdgeInsets.all(16),
  //         ),
  //       ),
  //       const SizedBox(height: 4),
  //       Text(label, style: const TextStyle(fontSize: 12)),
  //     ],
  //   );
  // }
}