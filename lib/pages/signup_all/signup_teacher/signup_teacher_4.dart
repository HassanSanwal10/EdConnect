import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/pages/signup_all/signup_teacher/signup_teacher_5.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import this package

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Just a little more...',
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
            padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Column(
              children: [
                // Upload Profile Photo
                Center(
                  child: GestureDetector(
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
                ),
                const SizedBox(height: 20.0),
                // About Me (Short Bio)
                TextField(
                  controller: _bioController,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'About Me',
                    hintText: 'Write a brief intro about yourself',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 3),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    //prefixIcon: Icon(Icons.email),
                  ),
                ),
                const SizedBox(height: 20.0),
                // Next Button
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const SignupTeacher5()),
                      );
                    },
                    child: const Text(
                      'Next',
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
}
