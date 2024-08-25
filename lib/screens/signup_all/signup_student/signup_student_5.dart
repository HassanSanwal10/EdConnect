import 'package:edconnect/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

class SignupStudent5 extends StatelessWidget {
  SignupStudent5({super.key});
  // Example data
  final Map<String, String> personalInfo = {
    'Full Name': 'John Doe',
    'Date of Birth': '01/01/2000',
    'Gender': 'Male',
    'Location': 'New York, USA',
  };

  final Map<String, String> learningPreferences = {
    'Subjects': 'Math, Science',
    'Learning Style': 'Visual',
    'Mode of Learning': 'Online',
  };

  final Map<String, String> availability = {
    'Available Days': 'Monday, Wednesday, Friday',
    'Preferred Time Zone': 'EST (Eastern Standard Time)',
  };

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Submission Successful'),
          content: const Text('Thank you for submitting your profile.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildReviewSection({
    required BuildContext context,
    required String title,
    required Map<String, String> content,
    required VoidCallback onEdit,
  }) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            ...content.entries.map(
              (entry) => Text(
                '${entry.key}: ${entry.value}',
                style: const TextStyle(fontSize: 16.0),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: onEdit,
                child: const Text('Edit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('student sign up'),
        forceMaterialTransparency: true,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildReviewSection(
              context: context,
              title: 'Personal Info',
              content: personalInfo,
              onEdit: () {
                // Navigate to edit personal info page
              },
            ),
            const SizedBox(height: 16.0),
            _buildReviewSection(
              context: context,
              title: 'Learning Preferences',
              content: learningPreferences,
              onEdit: () {
                // Navigate to edit learning preferences page
              },
            ),
            const SizedBox(height: 16.0),
            _buildReviewSection(
              context: context,
              title: 'Availability',
              content: availability,
              onEdit: () {
                // Navigate to edit availability page
              },
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showConfirmationDialog(context);
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
