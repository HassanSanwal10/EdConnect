import 'package:edconnect/screens/signup_all/signup_student/signup_student_5.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignupStudent4 extends StatefulWidget {
  const SignupStudent4({super.key});

  @override
  State<SignupStudent4> createState() => _SignupStudent4State();
}

class _SignupStudent4State extends State<SignupStudent4> {
  File? _profilePhoto;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _introductionController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profilePhoto = File(pickedFile.path);
      });
    }
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Photo Section
              const Text(
                "Profile Photo",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    _profilePhoto != null ? FileImage(_profilePhoto!) : null,
                child: _profilePhoto == null
                    ? const Icon(Icons.person, size: 50)
                    : null,
              ),
              const SizedBox(height: 8.0),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: const Icon(Icons.upload),
                label: const Text("Upload Profile Photo"),
              ),
              const SizedBox(height: 16.0),

              // Short Introduction Section
              TextField(
                controller: _introductionController,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: "Short Introduction",
                  hintText: "Write a brief introduction about yourself",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),

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
    );
  }
}
