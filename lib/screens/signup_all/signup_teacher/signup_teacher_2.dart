import 'package:edconnect/screens/signup_all/signup_teacher/signup_teacher_3.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupTeacher2 extends StatefulWidget {
  const SignupTeacher2({super.key});

  @override
  State<SignupTeacher2> createState() => _SignupTeacher2State();
}

class _SignupTeacher2State extends State<SignupTeacher2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> _degrees = [];
  final List<String> _subjects = [];
  final _degreesController = TextEditingController();
  final _subjectsController = TextEditingController();
  final _experienceController = TextEditingController();

  void _addDegree() {
    if (_degreesController.text.isNotEmpty) {
      setState(() {
        _degrees.add(_degreesController.text);
        _degreesController.clear();
      });
    }
  }

  void _removeDegree(String degree) {
    setState(() {
      _degrees.remove(degree);
    });
  }

  void _addSubject() {
    if (_subjectsController.text.isNotEmpty) {
      setState(() {
        _subjects.add(_subjectsController.text);
        _subjectsController.clear();
      });
    }
  }

  void _removeSubject(String subject) {
    setState(() {
      _subjects.remove(subject);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Check if degrees list is empty
      if (_degrees.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please add at least one degree.'),
          ),
        );
      } else if (_subjects.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please add at least one subject.'),
          ),
        );
      } else {
        // If the form is valid, proceed to the next screen
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const SignupTeacher3()),
        );
      }
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
      newChild: Form(
        key: _formKey,
        child: Column(
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
                        'Qualifications',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please provide required information',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 15),
                      DropdownButtonFormField<String>(
                        items: [
                          'High School',
                          'Associate\'s Degree',
                          'Bachelor\'s Degree',
                          'Master\'s Degree',
                          'Ph.D.',
                        ]
                            .map((mode) => DropdownMenuItem<String>(
                                  value: mode,
                                  child: Text(mode),
                                ))
                            .toList(),
                        onChanged: (value) {},
                        validator: (value) => value == null
                            ? 'Please select an education level'
                            : null,
                        decoration: const InputDecoration(
                          labelText: 'Highest Education Level',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 20.0),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 3),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFEF9A9A), width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xFFEF9A9A), width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tap on card to remove it',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _degreesController,
                              labelText: 'Add Degree/Certification',
                              hintText: 'Enter a degree or certification',
                            ),
                          ),
                          IconButton(
                            onPressed: _addDegree,
                            icon: const Icon(
                              Icons.arrow_downward,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      _degrees.isNotEmpty
                          ? Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: _degrees
                                  .map(
                                    (degree) => GestureDetector(
                                      onTap: () {
                                        _removeDegree(degree);
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          child: Text(
                                            degree,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList())
                          : Container(),
                      const SizedBox(height: 5),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tap on card to remove it',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _subjectsController,
                              labelText: 'Add Subjects',
                              hintText: 'Enter a subject you can teach',
                            ),
                          ),
                          IconButton(
                            onPressed: _addSubject,
                            icon: const Icon(
                              Icons.arrow_downward,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      _subjects.isNotEmpty
                          ? Wrap(
                              spacing: 10, // Space between the items
                              runSpacing: 10, // Space between rows
                              children: _subjects
                                  .map(
                                    (subject) => GestureDetector(
                                      onTap: () {
                                        _removeSubject(subject);
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5, horizontal: 10),
                                          child: Text(
                                            subject,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList())
                          : Container(),
                      const SizedBox(height: 15.0),
                      CustomTextField(
                        controller: _experienceController,
                        labelText: 'Experience',
                        hintText: 'Years in Teaching',
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your years of experience';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    15.0), // Rounded corners
                              ),
                            ),
                          ),
                          onPressed: _submitForm,
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
      ),
    );
  }
}
