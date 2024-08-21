import 'package:edconnect/class/theme_setting.dart';
import 'package:edconnect/pages/home_page.dart';
import 'package:edconnect/pages/signup_all/sign_up_page.dart';
import 'package:edconnect/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _secureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 01,
        //backgroundColor: Colors.red,
        forceMaterialTransparency: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness:
              ThemeSettings.isDarkModeOn ? Brightness.light : Brightness.dark,
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
                    'assets/images/image4.png',
                    width: 245.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                //login text
                const Text(
                  'Log in',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                const SizedBox(height: 10),
                //login with icons text
                const Text(
                  'Login with social networks',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                //social media widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/button_fb.png',
                        height: 45.0, fit: BoxFit.cover),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/button_ig.png',
                        width: 45.0, fit: BoxFit.cover),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/button_g+.png',
                        width: 45.0, fit: BoxFit.cover)
                  ],
                ),
                const SizedBox(height: 4),
                //email textfield
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: CustomTextField(
                    controller: _emailController,
                    labelText: 'E-mail',
                    hintText: 'Type Your Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                //password textfield
                Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
                  child: CustomTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Type Your Password',
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
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                //forget password button
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                      fontSize: 16,
                      //color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                //login button
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
                                  BorderRadius.circular(15.0) // Rounded corners
                              ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const HomePage()),
                        );
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                //signup button
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      //color: Colors.black54,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
