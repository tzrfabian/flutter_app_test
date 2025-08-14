import 'package:flutter/material.dart';
import 'user_info_dialog.dart';

class UserInfoForm extends StatefulWidget {
  const UserInfoForm({super.key});

  @override
  State<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _jobController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _jobController.dispose();
    super.dispose();
  }

  void _showUserInfo() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,  
        builder: (BuildContext context) {
          return UserInfoDialog(
            name: _nameController.text,
            age: int.parse(_ageController.text),
            job: _jobController.text,
            onClear: _clearForm,
          );
        },
      );
    }
  }

  void _clearForm() {
    _nameController.clear();
    _ageController.clear();
    _jobController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Please enter your information:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          
          // Name input
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your full name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          // Age input
          TextFormField(
            controller: _ageController,
            decoration: const InputDecoration(
              labelText: 'Age',
              hintText: 'Enter your age',
              prefixIcon: Icon(Icons.cake),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age';
              }
              final age = int.tryParse(value);
              if (age == null || age < 1 || age > 120) {
                return 'Please enter a valid age (1-120)';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          
          // Job input
          TextFormField(
            controller: _jobController,
            decoration: const InputDecoration(
              labelText: 'Job',
              hintText: 'Enter your job title',
              prefixIcon: Icon(Icons.work),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your job';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          
          // Submit button
          ElevatedButton(
            onPressed: _showUserInfo,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Submit & Show Info'),
          ),
          const SizedBox(height: 12),
          
          // Clear button
          OutlinedButton(
            onPressed: _clearForm,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: const TextStyle(fontSize: 16),
            ),
            child: const Text('Clear Form'),
          ),
        ],
      ),
    );
  }
}