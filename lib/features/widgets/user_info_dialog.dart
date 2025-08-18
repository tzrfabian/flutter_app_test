import 'package:flutter/material.dart';

class UserInfoDialog extends StatelessWidget {
  const UserInfoDialog({
    super.key,
    required this.name,
    required this.age,
    required this.job,
    required this.onClear,
  });

  final String name;
  final int age;
  final String job;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('User Information'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Name: $name',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Age: $age',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            'Job: $job',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => {
            Navigator.of(context).pop(),
            onClear(),
          },
          child: const Text('OK'),
        ),
        TextButton(
          onPressed: () => {
            Navigator.of(context).pop(),
            onClear(),
          },
          child: const Text('Clear & Close'),
        )
      ],
    );
  }
}