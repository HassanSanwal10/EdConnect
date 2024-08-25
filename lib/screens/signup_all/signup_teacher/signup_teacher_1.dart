import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/screens/signup_all/signup_teacher/signup_teacher_2.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupTeacher1 extends StatefulWidget {
  const SignupTeacher1({super.key});

  @override
  State<SignupTeacher1> createState() => _SignupTeacher1State();
}

class _SignupTeacher1State extends State<SignupTeacher1> {
  final _firstNameContorller = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Tell us about You!',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        elevation: 0,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //personal detials text
                const Text(
                  'Personal Details',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                // pls provide required info text
                const Text(
                  'Please provide required information',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                //first name textfield
                CustomTextField(
                    controller: _firstNameContorller,
                    labelText: 'First Name',
                    hintText: 'Enter your First Name'),
                const SizedBox(height: 20),
                //last name textfield
                CustomTextField(
                    controller: _lastNameController,
                    labelText: 'Last Name',
                    hintText: 'Enter your Last Name'),
                const SizedBox(height: 20),
                //Date of Birth textfield
                CustomTextField(
                    controller: _dateOfBirthController,
                    labelText: 'Date of Birth',
                    hintText: 'Day/Month/Year'),
                const SizedBox(height: 20),
                //gender box
                DropdownButtonFormField(
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                    DropdownMenuItem(
                      value: 'Other',
                      child: Text('Other'),
                    ),
                  ],
                  onChanged: (value) {},
                  decoration: const InputDecoration(
                    labelText: 'Gender (Required)',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  selectedItemBuilder: (BuildContext context) {
                    return const [
                      Text(
                        'Male',
                        style: TextStyle(
                          color: Colors.blue, // Custom color for selected item
                        ),
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                          color: Colors.pink, // Custom color for selected item
                        ),
                      ),
                      Text(
                        'Other',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ];
                  },
                ),
                const SizedBox(height: 20),
                //addres line 1 textfield
                CustomTextField(
                    controller: _addressLine1Controller,
                    labelText: 'Address Line 1',
                    hintText: 'House no, Block, Society'),
                const SizedBox(height: 20),
                //addres line 1 textfield
                CustomTextField(
                    controller: _addressLine2Controller,
                    labelText: 'Address Line 2',
                    hintText: 'City, Postal Code'),
                const SizedBox(height: 25),
                //next button
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: SizedBox(
                    width: double.infinity,
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
                              builder: (_) => const SignupTeacher2()),
                        );
                      },
                      child: const Text(
                        'Next',
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
    );
  }
}
