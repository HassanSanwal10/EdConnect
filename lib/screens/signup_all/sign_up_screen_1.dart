import 'package:edconnect/screens/login/login_screen.dart';
import 'package:edconnect/screens/signup_all/sign_up_screen_2.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({super.key});

  @override
  State<SignUpScreen1> createState() => _SignUpScreen1State();
}

class _SignUpScreen1State extends State<SignUpScreen1> {
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formLogInKey = GlobalKey<FormState>();
  bool _secureText1 = true;
  bool _secureText2 = true;
  bool _rememberPassword = false;
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
                        'Get Started',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      const SizedBox(height: 15),
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
                        isObscureText: _secureText1,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _secureText1 = !_secureText1;
                            });
                          },
                          icon: Icon(
                            _secureText1
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //Full name Text field
                      CustomTextField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          return null;
                        },
                        controller: _confirmPasswordController,
                        labelText: 'Confirm Password',
                        hintText: 'Confirm Password',
                        isObscureText: _secureText2,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _secureText2 = !_secureText2;
                            });
                          },
                          icon: Icon(
                            _secureText2
                                ? CupertinoIcons.eye_slash
                                : CupertinoIcons.eye,
                            color: Colors.green,
                          ),
                        ),
                      ),

                      const SizedBox(height: 15),
                      // Remember me and forget password button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  value: _rememberPassword,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _rememberPassword = value!;
                                    });
                                  }),
                              const Text(
                                'I agree to the Terms and Service conditions',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // Sign up button
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
                                _rememberPassword) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Processing Data...'),
                              ));
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const SignUpPage2()),
                              );
                            } else if (!_rememberPassword) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text('Please check "Remember Password"'),
                              ));
                            }
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //divider row for sign up options
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
                      const SizedBox(height: 10),
                      //signup icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Brand(
                            Brands.facebook,
                            size: 50,
                          ),
                          Brand(
                            Brands.google,
                            size: 50,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      // Sign up options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 14),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 14),
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
