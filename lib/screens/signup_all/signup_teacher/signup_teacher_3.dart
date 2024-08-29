import 'package:edconnect/screens/signup_all/signup_teacher/signup_teacher_4.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:edconnect/widgets/custom_scaffold.dart'; // Assuming you have this for the custom container

class SignupTeacher3 extends StatefulWidget {
  const SignupTeacher3({super.key});

  @override
  State<SignupTeacher3> createState() => _SignupTeacher3State();
}

class _SignupTeacher3State extends State<SignupTeacher3> {
  final _monthlyRateController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<String> _daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  final Map<String, bool> _selectedDays = {};
  String? _preferredMode;

  @override
  void initState() {
    super.initState();
    for (var day in _daysOfWeek) {
      _selectedDays[day] = false;
    }
  }

  void _onDaySelected(String day, bool selected) {
    setState(() {
      _selectedDays[day] = selected;
    });
  }

  bool _noDaySelected() {
    for (var day in _daysOfWeek) {
      if (_selectedDays[day] == true) {
        return false;
      }
    }
    return true;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Check if degrees list is empty
      if (_noDaySelected()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select at least one day.'),
          ),
        );
      } else {
        // If the form is valid, proceed to the next screen
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => const SignupTeacher4()),
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
            Flexible(
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
                          'Availability',
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
                        const SizedBox(height: 10),
                        // Available Days and Times
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Which Days You\'re available on?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        //days of week buttons
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: _daysOfWeek
                              .map(
                                (day) => FilterChip(
                                  label: Text(day),
                                  selected: _selectedDays[day] ?? false,
                                  onSelected: (bool selected) {
                                    _onDaySelected(day, selected);
                                  },
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 10),
                        // Preferred Mode of Teaching
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Preferred Mode of Teaching?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          items: ['Online', 'Offline', 'Both']
                              .map((mode) => DropdownMenuItem<String>(
                                    value: mode,
                                    child: Text(mode),
                                  ))
                              .toList(),
                          validator: (value) => value == null
                              ? 'Please select an education level'
                              : null,
                          onChanged: (value) {
                            setState(() {
                              _preferredMode = value;
                            });
                          },
                          value: _preferredMode,
                          decoration: const InputDecoration(
                            labelText: 'Highest Education Level',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 18.0, horizontal: 20.0),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 3),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEF9A9A), width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xFFEF9A9A), width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        // Monthly Rate
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'What\'s Your Monthly Rate?',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _monthlyRateController,
                          labelText: 'Monthly Rate',
                          hintText: 'Enter monthly rate',
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
                              shape: WidgetStateProperty.all<
                                  RoundedRectangleBorder>(
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
            ),
          ],
        ),
      ),
    );
  }
}
