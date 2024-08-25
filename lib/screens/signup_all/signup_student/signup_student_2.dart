import 'package:edconnect/screens/signup_all/signup_student/signup_student_3.dart';
import 'package:flutter/material.dart';

class SignupStudent2 extends StatefulWidget {
  const SignupStudent2({super.key});

  @override
  State<SignupStudent2> createState() => _SignupStudent2State();
}

class _SignupStudent2State extends State<SignupStudent2> {
  final TextEditingController _subjectsController = TextEditingController();
  String? _selectedLearningStyle;
  String? _selectedModeOfLearning;
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Subjects You Want to Learn Field
              TextField(
                controller: _subjectsController,
                decoration: InputDecoration(
                  labelText: 'Subjects You Want to Learn',
                  hintText: "Enter the subjects you're interested in",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Preferred Learning Style Dropdown
              DropdownButtonFormField<String>(
                value: _selectedLearningStyle,
                items: ['Visual', 'Audio', 'Practical', 'Mixed']
                    .map((style) => DropdownMenuItem<String>(
                          value: style,
                          child: Text(style),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedLearningStyle = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Preferred Learning Style',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

              // Preferred Mode of Learning Dropdown
              DropdownButtonFormField<String>(
                value: _selectedModeOfLearning,
                items: ['Online', 'Offline', 'Both']
                    .map((mode) => DropdownMenuItem<String>(
                          value: mode,
                          child: Text(mode),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedModeOfLearning = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Preferred Mode of Learning',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              // Next Button
              Center(
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const SignupStudent3()),
                      );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
