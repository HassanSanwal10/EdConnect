import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/screens/signup_all/signup_teacher/signup_teacher_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupTeacher2 extends StatefulWidget {
  const SignupTeacher2({super.key});

  @override
  State<SignupTeacher2> createState() => _SignupTeacher2State();
}

class _SignupTeacher2State extends State<SignupTeacher2> {
  final List<String> _degrees = [];
  final List<String> _subjects = [];
  //final _educationLevelController = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'A little more!',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Qualifications',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Please provide required information',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
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
                  decoration: const InputDecoration(
                    labelText: 'Highest Education Level',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
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
                  ),
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'Tap on card to remove it',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _degreesController,
                        decoration: const InputDecoration(
                          labelText: 'Add Degree/Certification',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          hintText: 'Enter a degree or certification',
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
                          //prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _addDegree,
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _degrees.isNotEmpty
                    ? Wrap(
                        spacing: 10, // Space between the items
                        runSpacing: 10, // Space between rows
                        children: _degrees
                            .map(
                              (degree) => GestureDetector(
                                onTap: () {
                                  _removeDegree(degree);
                                },
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
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
                const SizedBox(height: 10),
                const Text(
                  'Tap on card to remove it',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _subjectsController,
                        decoration: const InputDecoration(
                          labelText: 'Add Subject',
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          hintText: 'Enter a subject you can teach',
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
                          //prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _addSubject,
                      icon: const Icon(
                        Icons.arrow_downward,
                        size: 35,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
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
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5, left: 10, right: 10),
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
                const SizedBox(height: 16.0),
                TextField(
                  controller: _experienceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Years of Experience',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    hintText: 'Number of Years in teaching',
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
                const SizedBox(height: 25),
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
                              builder: (_) => const SignupTeacher3()),
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
