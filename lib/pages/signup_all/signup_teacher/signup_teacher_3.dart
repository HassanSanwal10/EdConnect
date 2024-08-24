import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/pages/signup_all/signup_teacher/signup_teacher_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignupTeacher3 extends StatefulWidget {
  const SignupTeacher3({super.key});

  @override
  State<SignupTeacher3> createState() => _SignupTeacher3State();
}

class _SignupTeacher3State extends State<SignupTeacher3> {
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
  // ignore: unused_field
  String? _hourlyRate;

  @override
  void initState() {
    super.initState();
    // Initialize _selectedDays map with all days set to false
    for (var day in _daysOfWeek) {
      _selectedDays[day] = false;
    }
  }

  void _onDaySelected(String day, bool selected) {
    setState(() {
      _selectedDays[day] = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Important Info!',
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
          child: ListView(
            children: [
              const Text(
                'Availability',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Please provide required information',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              // Available Days and Times
              const Text(
                'Days You\'re avaiable on?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
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
              const SizedBox(height: 10.0),
              // Preferred Mode of Teaching
              const Text(
                'Prefered Mode of Teaching?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Preferred Mode of Teaching',
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
                    borderSide: BorderSide(color: Colors.green, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                value: _preferredMode,
                items: ['Online', 'Offline', 'Both']
                    .map((mode) => DropdownMenuItem<String>(
                          value: mode,
                          child: Text(mode),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _preferredMode = value;
                  });
                },
              ),
              const SizedBox(height: 10.0),
              // Hourly Rate
              const Text(
                'What\'s You\'re Monthly Rate?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Monthly Rate',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Enter your Monthly rate',
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
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _hourlyRate = value;
                  });
                },
              ),
              const SizedBox(height: 20),
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
                            builder: (_) => const SignupTeacher4()),
                      );
                    },
                    child: const Text(
                      'Next',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
