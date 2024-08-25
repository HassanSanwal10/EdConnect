import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupTeacher5 extends StatelessWidget {
  const SignupTeacher5({super.key});

  final String personalInfo = 'John Doe\njohn.doe@example.com';
  final String qualifications = 'Bachelor\'s Degree in Computer Science';
  final String availability = 'Monday to Friday, 9 AM - 5 PM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Done!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        elevation: 01,
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              ThemeSettings.isDarkModeOn ? Brightness.light : Brightness.dark,
        ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Personal Info Section
                _buildReviewSection(
                  context,
                  title: 'Personal Info',
                  content: personalInfo,
                  onEdit: () {
                    // Navigate to edit personal info page
                  },
                ),
                const SizedBox(height: 16.0),

                // Qualifications Section
                _buildReviewSection(
                  context,
                  title: 'Qualifications',
                  content: qualifications,
                  onEdit: () {
                    // Navigate to edit qualifications page
                  },
                ),
                const SizedBox(height: 16.0),

                // Availability Section
                _buildReviewSection(
                  context,
                  title: 'Availability',
                  content: availability,
                  onEdit: () {
                    // Navigate to edit availability page
                  },
                ),
                const SizedBox(height: 16.0),

                // Submit Button
                SizedBox(
                  width: 150,
                  height: 60,
                  child: FilledButton(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0), // Rounded corners
                        ),
                      ),
                    ),
                    onPressed: () {
                      _showConfirmationDialog(context);
                    },
                    child: const Text(
                      'Submit',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewSection(BuildContext context,
      {required String title,
      required String content,
      required VoidCallback onEdit}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
            const SizedBox(height: 8.0),
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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Submission Successful'),
          content: const Text(
              'Thank you for your submission! A verification email will be sent shortly.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
