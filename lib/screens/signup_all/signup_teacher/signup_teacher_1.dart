import 'package:edconnect/screens/signup_all/signup_teacher/signup_teacher_2.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignupTeacher1 extends StatefulWidget {
  const SignupTeacher1({super.key});

  @override
  State<SignupTeacher1> createState() => _SignupTeacher1State();
}

class _SignupTeacher1State extends State<SignupTeacher1> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _postalCodeController = TextEditingController();
  final _genderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dateOfBirthController.text = DateFormat.yMMMd().format(picked);
      });
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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //personal detial text
                      const Text(
                        'Personal Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      const SizedBox(height: 15),
                      //first name text field
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: _firstNameController,
                        labelText: 'First Name',
                        hintText: 'Enter First Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your First Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      //last name text field
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: _lastNameController,
                        labelText: 'Last Name',
                        hintText: 'Enter Last Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Last Name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      //date of birth field
                      CustomTextField(
                        keyboardType: TextInputType.datetime,
                        controller: _dateOfBirthController,
                        labelText: 'Date of Birth',
                        hintText: 'Select your birth date',
                        isReadOnly: true,
                        givenOnTap: () => _selectDate(context),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Date of Birth';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      //gender select field
                      DropdownButtonFormField<String>(
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
                        onChanged: (value) {
                          setState(() {
                            _genderController.text = value!;
                          });
                        },
                        decoration: const InputDecoration(
                          labelText: 'Gender (Required)',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                        selectedItemBuilder: (BuildContext context) {
                          return const [
                            Text(
                              'Male',
                              style: TextStyle(
                                color: Colors
                                    .blue, // Custom color for selected item
                              ),
                            ),
                            Text(
                              'Female',
                              style: TextStyle(
                                color: Colors
                                    .pink, // Custom color for selected item
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
                      const SizedBox(height: 15),
                      //address field
                      CustomTextField(
                        keyboardType: TextInputType.streetAddress,
                        controller: _addressLine1Controller,
                        labelText: 'Address',
                        hintText: 'House no, Block, Society, City',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      //postal code
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: _postalCodeController,
                        labelText: 'Postal Code',
                        hintText: 'Postal Code',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your postal code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      //next button
                      SizedBox(
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
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const SignupTeacher2()),
                              );
                            }
                          },
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
          ),
        ],
      ),
    );
  }
}
