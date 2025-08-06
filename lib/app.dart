import 'package:flutter/material.dart';
import 'package:flutter_app_test/features/user_info/pages/user_info_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
      ),
      home: const UserInfoPage(title: 'User Information Form'),
    );
  }
}