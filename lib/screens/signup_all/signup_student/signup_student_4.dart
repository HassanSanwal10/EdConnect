import 'package:edconnect/screens/signup_all/signup_student/signup_student_5.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignupStudent4 extends StatefulWidget {
  const SignupStudent4({super.key});

  @override
  State<SignupStudent4> createState() => _SignupStudent4State();
}

class _SignupStudent4State extends State<SignupStudent4> {
  XFile? _profilePhoto;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _bioController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _profilePhoto = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return CustomScaffold(
      bgColor: isDarkMode
          ? darkMode.scaffoldBackgroundColor
          : lightMode.scaffoldBackgroundColor,
      newChild: Column(children: [
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
            height: double.infinity,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Profile Picture/Bio',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
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
                const SizedBox(height: 25),
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
                          MaterialPageRoute(builder: (_) => SignupStudent5()),
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
      ]),
    );
  }
}
