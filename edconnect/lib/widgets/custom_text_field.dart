import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool? isObscureText;
  final String? obscureCharacter;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.isObscureText = false,
      this.obscureCharacter = '*',
      required this.labelText,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText!,
      obscuringCharacter: obscureCharacter!,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),

        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,

        labelText: labelText,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),

        hintText: hintText,

        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),

        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        //prefixIcon: Icon(Icons.email),
      ),
    );
  }
}
