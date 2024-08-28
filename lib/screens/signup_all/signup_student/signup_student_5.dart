import 'package:edconnect/screens/login/login_screen.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SignupStudent5 extends StatelessWidget {
  SignupStudent5({super.key});

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
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Card(
      elevation: 2.0,
      color: isDarkMode ? darkMode.cardColor : lightMode.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
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
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 14.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return CustomScaffold(
      bgColor: isDarkMode
          ? darkMode.scaffoldBackgroundColor
          : lightMode.scaffoldBackgroundColor,
      newChild: Column(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 200,
              child: Image.asset(
                'assets/images/edconnect_w.png',
                alignment: Alignment.center,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: isDarkMode
                    ? darkMode.scaffoldBackgroundColor
                    : lightMode.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Review & Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 15),
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
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          _showConfirmationDialog(context);
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
