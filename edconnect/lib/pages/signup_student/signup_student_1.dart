import 'package:flutter/material.dart';

class SignupStudent1 extends StatelessWidget {
  const SignupStudent1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('student sign up'),
        elevation: 01,
        backgroundColor: Colors.red,
        forceMaterialTransparency: true,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFFE3562A),
                size: 40,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
