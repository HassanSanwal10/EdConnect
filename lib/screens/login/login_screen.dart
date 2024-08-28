import 'package:edconnect/screens/login/forgot_password_screen.dart';
import 'package:edconnect/screens/home/home_page.dart';
import 'package:edconnect/screens/signup_all/sign_up_screen_1.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formLogInKey = GlobalKey<FormState>();
  bool _secureText = true;
  bool _agreePersonalData = false;

  @override
  Widget build(BuildContext context) {
    // Determine the theme mode dynamically
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
            flex: 7,
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
              width: double.infinity,
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
                  key: _formLogInKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Login text
                      const Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(height: 20),
                      // Email text field
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                        controller: _emailController,
                        labelText: 'Email',
                        hintText: 'Enter Email',
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15),
                      // Password text field
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter password';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        isObscureText: _secureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _secureText = !_secureText;
                            });
                          },
                          icon: Icon(
                            _secureText
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Remember me and forget password button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: _agreePersonalData,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _agreePersonalData = value!;
                                    });
                                  }),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          const ForgotPasswordScreen()));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Login button
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      15.0) // Rounded corners
                                  ),
                            ),
                          ),
                          onPressed: () {
                            if (_formLogInKey.currentState!.validate() &&
                                _agreePersonalData) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const HomePage()),
                              );
                            } else if (!_agreePersonalData) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text('Please check "Remember Password"'),
                              ));
                            }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //or login with text and fivider
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 0),
                            child: Text(
                              'Or Login With',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(child: Divider())
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Brand(
                            Brands.facebook,
                            size: 60,
                          ),
                          Brand(
                            Brands.google,
                            size: 60,
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      // Sign up options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account?',
                            style: TextStyle(fontSize: 16),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const SignUpScreen1()),
                                );
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(fontSize: 16),
                              )),
                        ],
                      )
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
