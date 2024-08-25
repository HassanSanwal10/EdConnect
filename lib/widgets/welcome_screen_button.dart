import 'package:flutter/material.dart';

class WelcomeScreenButton extends StatelessWidget {
  const WelcomeScreenButton(
      {super.key,
      this.buttonText,
      this.onTap,
      required this.color,
      required this.textColor});
  final String? buttonText;
  final Widget? onTap;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => onTap!));
      },
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: color,
            borderRadius:
                const BorderRadius.only(topLeft: Radius.circular(50))),
        child: Text(
          textAlign: TextAlign.center,
          buttonText!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
