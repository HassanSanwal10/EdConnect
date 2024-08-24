import 'package:edconnect/pages/signup_all/signup_student/signup_student_4.dart';
import 'package:flutter/material.dart';

class SignupStudent3 extends StatefulWidget {
  const SignupStudent3({super.key});

  @override
  State<SignupStudent3> createState() => _SignupStudent3State();
}

class _SignupStudent3State extends State<SignupStudent3> {
  final Map<String, bool> _selectedDays = {
    'Monday': false,
    'Tuesday': false,
    'Wednesday': false,
    'Thursday': false,
    'Friday': false,
    'Saturday': false,
    'Sunday': false,
  };

  String? _selectedTimeZone;
  final List<String> _timeZones = [
    'GMT',
    'EST',
    'PST',
    'CST',
    'MST',
    // Add more time zones as needed
  ];

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
              // Available Days and Times
              const Text(
                "Available Days and Times",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Column(
                children: _selectedDays.keys.map((String day) {
                  return CheckboxListTile(
                    title: Text(day),
                    value: _selectedDays[day],
                    onChanged: (bool? value) {
                      setState(() {
                        _selectedDays[day] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),

              // Preferred Time Zone
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Preferred Time Zone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                value: _selectedTimeZone,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedTimeZone = newValue!;
                  });
                },
                items: _timeZones.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16.0),
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
                            builder: (_) => const SignupStudent4()),
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
