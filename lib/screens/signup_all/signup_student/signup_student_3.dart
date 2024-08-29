import 'package:edconnect/screens/signup_all/signup_student/signup_student_4.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignupStudent3 extends StatefulWidget {
  const SignupStudent3({super.key});

  @override
  State<SignupStudent3> createState() => _SignupStudent3State();
}

class _SignupStudent3State extends State<SignupStudent3> {
  final _formKey = GlobalKey<FormState>();
  final _monthlyRateController = TextEditingController();
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

  String? _selectedTime;
  final List<String> _timing = [
    'Morning',
    'Noon',
    'Evening',
  ];

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
                      //availability text
                      const Text(
                        "Availability",
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      //which days available text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Which Days You're available on?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //days boxes
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
                      const SizedBox(height: 15),
                      //which days available text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Which Time do You want to Study?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //time zone box
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Preferred Time to Study',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        value: _selectedTime,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedTime = newValue!;
                          });
                        },
                        items: _timing
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 15),
                      //monthly rate text
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "How much are you willing to pay?",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //monthly rate text field
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
                      //button
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
                                  builder: (_) => const SignupStudent4(),
                                ),
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
