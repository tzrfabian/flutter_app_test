import 'package:flutter/material.dart';
import 'package:flutter_app_test/features/user_info/widgets/user_info_form.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: UserInfoForm(),
      ),
    );
  }
}
