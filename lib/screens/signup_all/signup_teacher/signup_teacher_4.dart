import 'package:edconnect/screens/signup_all/signup_teacher/signup_teacher_5.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignupTeacher4 extends StatefulWidget {
  const SignupTeacher4({super.key});

  @override
  State<SignupTeacher4> createState() => _SignupTeacher4State();
}

class _SignupTeacher4State extends State<SignupTeacher4> {
  XFile? _profilePhoto;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _bioController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profilePhoto = pickedFile;
    });
  }

  void _validateAndProceed() {
    if (_profilePhoto == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please upload a profile picture.'),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const SignupTeacher5()),
      );
    }
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
                    const Text(
                      'Profile Picture/Bio',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    ),
                    const SizedBox(height: 15),
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: _profilePhoto != null
                            ? FileImage(File(_profilePhoto!.path))
                            : null,
                        child: _profilePhoto == null
                            ? const Icon(
                                Icons.add_a_photo,
                                size: 80,
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    CustomTextField(
                      controller: _bioController,
                      labelText: 'About Me',
                      hintText: 'Write a brief intro about yourself',
                      minLin: 1,
                      maxLin: 5,
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                        onPressed: _validateAndProceed,
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
