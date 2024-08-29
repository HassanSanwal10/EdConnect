import 'package:edconnect/screens/signup_all/signup_student/signup_student_2.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignupStudent1 extends StatefulWidget {
  const SignupStudent1({super.key});

  @override
  State<SignupStudent1> createState() => _SignupStudent1State();
}

class _SignupStudent1State extends State<SignupStudent1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _postalCodeController = TextEditingController();
  String? _selectedGender;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _dobController.text = DateFormat.yMMMd().format(picked);
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
                      const Text(
                        'Personal Details',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // first Name Field
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: _firstNameController,
                        labelText: 'First Name',
                        hintText: 'Enter your First name',
                      ),
                      const SizedBox(height: 15),
                      // last Name Field
                      CustomTextField(
                        keyboardType: TextInputType.name,
                        controller: _lastNameController,
                        labelText: 'Last Name',
                        hintText: 'Enter your Last name',
                      ),
                      const SizedBox(height: 15),
                      // Date of Birth Field
                      CustomTextField(
                        keyboardType: TextInputType.datetime,
                        controller: _dobController,
                        labelText: 'Date of Birth',
                        hintText: 'Select your birth date',
                        isReadOnly: true,
                        givenOnTap: () => _selectDate(context),
                      ),
                      const SizedBox(height: 15),
                      // Gender Dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedGender,
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem<String>(
                                  value: gender,
                                  child: Text(gender),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Gender',
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
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
                      // Location Field
                      CustomTextField(
                        keyboardType: TextInputType.streetAddress,
                        controller: _addressController,
                        labelText: 'Address',
                        hintText: 'Enter your Address',
                      ),
                      const SizedBox(height: 15),
                      // Postal Code Field
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        controller: _postalCodeController,
                        labelText: 'Postal Code',
                        hintText: 'Enter your Postal Code',
                      ),
                      const SizedBox(height: 25),
                      // Next Button
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const SignupStudent2(),
                                ),
                              );
                            }
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
