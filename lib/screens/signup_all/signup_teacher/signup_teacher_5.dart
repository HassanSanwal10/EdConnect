import 'package:edconnect/screens/login/login_screen.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:edconnect/class/teacher_class.dart';
import 'package:image_picker/image_picker.dart'; // Adjust the import based on your file structure

class SignupTeacher5 extends StatelessWidget {
  final Teacher? teacher; // Instance of Teacher class

  const SignupTeacher5({super.key, this.teacher});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    Teacher teacher = Teacher(
      email: 'sanwalgoku@gmail.com',
      password:
          'securePassword123', // Consider using a more secure method for passwords
      confirmPassword: 'securePassword123',
      firstName: 'Hassan',
      lastName: 'Sanwal',
      dateOfBirth: '01, 10, 1999',
      addressLine1: '123 Main St',
      postalCode: '12345',
      gender: 'Male',
      highestEducation: 'High School',
      degrees: [
        'Bachelor\'s Degree in Computer Science',
        'Master\'s Degree in Education'
      ],
      subjects: ['Mathematics', 'Physics'],
      experience: 5, // 5 years of experience
      availableDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      preferredMode: 'Online',
      monthlyRate: 2000.0, // Monthly rate in your currency
      bio:
          'lorem imsem dinasdn asindans iausfuafh as uhasd uiahs uidhasi dh aishdasfhiuwfas fas basudhas dad',
    );
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
              height: double.infinity,
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
                    // Title
                    const Text(
                      'Review & Submit',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const SizedBox(height: 20),
                    // Bio Section
                    _buildReviewSection(
                      context,
                      title: 'Profile',
                      content: 'Bio: ${teacher.bio}',
                      profilePhoto: XFile('path'),
                      onEdit: () {
                        // Navigate to edit qualifications page
                      },
                    ),

                    const SizedBox(height: 16.0),
                    // Personal Info Section
                    _buildReviewSection(
                      context,
                      title: 'Personal Info',
                      content:
                          'Name: ${teacher.firstName} ${teacher.lastName}\nEmail: ${teacher.email}\nDate of Birth: ${teacher.dateOfBirth}\nGender: ${teacher.gender}\nAddress: ${teacher.addressLine1}\nPostal Code: ${teacher.postalCode}',
                      onEdit: () {
                        // Navigate to edit personal info page
                      },
                    ),
                    const SizedBox(height: 16.0),

                    // Qualifications Section
                    _buildReviewSection(
                      context,
                      title: 'Qualifications',
                      content:
                          'Highest Qualification: ${teacher.highestEducation}\nDegrees: ${teacher.degrees.join(', ')}\nSubjects: ${teacher.subjects.join(', ')}\nExperience: ${teacher.experience}',
                      onEdit: () {
                        // Navigate to edit qualifications page
                      },
                    ),

                    const SizedBox(height: 16.0),

                    // Availability Section
                    _buildReviewSection(
                      context,
                      title: 'Availability',
                      content:
                          'Available Days: ${teacher.availableDays.join(', ')}\n'
                          'Preferred Mode: ${teacher.preferredMode}\n'
                          'Monthly Rate: \$${teacher.monthlyRate.toStringAsFixed(2)}',
                      onEdit: () {
                        // Navigate to edit availability page
                      },
                    ),

                    const SizedBox(height: 25),
                    // Submit Button
                    Center(
                      child: SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                            ),
                          ),
                          onPressed: () {
                            _showConfirmationDialog(context);
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
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

  Widget _buildReviewSection(BuildContext context,
      {XFile? profilePhoto,
      required String title,
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
            // Conditional Circular Image Avatar
            if (profilePhoto != null) ...[
              const Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/images/goku.jpg'),
                ),
              ),
            ],
            const SizedBox(height: 16.0), // Space between avatar and title
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
