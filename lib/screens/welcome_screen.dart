import 'package:edconnect/screens/login/login_screen.dart';
import 'package:edconnect/screens/signup_all/sign_up_screen_1.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_scaffold.dart';
import 'package:edconnect/widgets/welcome_screen_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
          Flexible(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome User\n',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\nConnecting Teachers and Students for a Better Learning Experience',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                      child: WelcomeScreenButton(
                    color: Colors.transparent,
                    textColor: Colors.white,
                    buttonText: 'Log In',
                    onTap: LoginScreen(),
                  )),
                  Expanded(
                      child: WelcomeScreenButton(
                    color: Colors.white,
                    textColor: lightMode.primaryColor,
                    buttonText: 'Sign Up',
                    onTap: const SignUpScreen1(),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
