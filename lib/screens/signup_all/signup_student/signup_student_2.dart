import 'package:edconnect/screens/signup_all/signup_student/signup_student_3.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupStudent2 extends StatefulWidget {
  const SignupStudent2({super.key});

  @override
  State<SignupStudent2> createState() => _SignupStudent2State();
}

class _SignupStudent2State extends State<SignupStudent2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectsController = TextEditingController();
  final List<String> _subjects = [];
  String? _selectedLearningStyle;
  String? _selectedGrade;
  String? _selectedModeOfLearning;

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
                      //Learning preference text
                      const Text(
                        'Learning Preferences',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 26),
                      ),
                      const SizedBox(height: 15),
                      //provide info text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Please provide required information',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //what grade are you in text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "What Grade are You in?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Select Grade Style Dropdown
                      DropdownButtonFormField<String>(
                        value: _selectedGrade,
                        items: [
                          'Kindergarten',
                          '1st Grade',
                          '2nd Grade',
                          '3rd Grade',
                          '4th Grade',
                          '5th Grade',
                          '6th Grade',
                          '7th Grade',
                          '8th Grade',
                          '9th Grade',
                          '10th Grade',
                          '11th Grade',
                          '12th Grade',
                          '13th Grade',
                          '14th Grade',
                          '15th Grade',
                          '16th Grade'
                        ]
                            .map((grade) => DropdownMenuItem<String>(
                                  value: grade,
                                  child: Text(grade),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedGrade = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Select Your Grade',
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      //tap to remove card text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Tap on card to remove it',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Subjects You Want to Learn Field
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: _subjectsController,
                              labelText: 'Subjects You Want to Learn',
                              hintText: "Enter subjects",
                            ),
                          ),
                          IconButton(
                            onPressed: _addSubject,
                            icon: const Icon(
                              Icons.arrow_downward,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      _subjects.isNotEmpty
                          ? Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: _subjects
                                  .map(
                                    (subject) => GestureDetector(
                                      onTap: () {
                                        _removeSubject(subject);
                                      },
                                      child: Card(
                                        color: isDarkMode
                                            ? darkMode.cardColor
                                            : lightMode.cardColor,
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
                      const SizedBox(height: 10.0),
                      //preferred learning style
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Preferred Learning Style?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //preferred mode of learning text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Preferred mode of learning?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
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
                          labelStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25.0),
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
            ),
          ),
        ],
      ),
    );
  }
}
