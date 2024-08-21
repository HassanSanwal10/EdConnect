import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/pages/signup_all/sign_up_page_2.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //image
                Center(
                  child: Image.asset(
                    'assets/images/image5.png',
                    width: 270.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                //sign up text
                const Text(
                  'Sign up',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                const SizedBox(height: 10),
                //create your account
                const Text(
                  'Createn your account',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 4),
                //username text field
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: CustomTextField(
                      controller: _userNameController,
                      labelText: 'Username',
                      hintText: 'Enter your Username'),
                ),
                //email text field
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: CustomTextField(
                      controller: _emailController,
                      labelText: 'E-mail',
                      hintText: 'Enter your Email'),
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: "Enter your password",
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
                ),
                const SizedBox(height: 20),
                //get started button
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
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
                              builder: (_) => const SignUpPage2()),
                        );
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                //login button
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Log In',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
