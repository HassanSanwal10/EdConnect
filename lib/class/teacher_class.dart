class Teacher {
  String email; // From SignUpScreen1
  String password; // From SignUpScreen1
  String confirmPassword; // From SignUpScreen1
  String firstName; // From SignupTeacher1
  String lastName; // From SignupTeacher1
  String dateOfBirth; // From SignupTeacher1
  String addressLine1; // From SignupTeacher1
  String postalCode; // From SignupTeacher1
  String gender; // From SignupTeacher1
  String highestEducation; // From SignupTeacher1
  List<String> degrees; // From SignupTeacher2
  List<String> subjects; // From SignupTeacher2
  int experience; // From SignupTeacher2
  List<String> availableDays; // From SignupTeacher3
  String preferredMode; // From SignupTeacher3
  double monthlyRate; // From SignupTeacher3
  String? profilePhoto; // From SignupTeacher4
  String bio; // From SignupTeacher4

  Teacher({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.addressLine1,
    required this.postalCode,
    required this.gender,
    required this.highestEducation,
    required this.degrees,
    required this.subjects,
    required this.experience,
    required this.availableDays,
    required this.preferredMode,
    required this.monthlyRate,
    this.profilePhoto, // Optional
    required this.bio,
  });
}
