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
  final bool? isReadOnly;
  final Function? givenOnTap;
  final String? Function(String?)? validator;
  final int? minLin;
  final int? maxLin;

  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.isReadOnly = false,
    this.obscureCharacter = '*',
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.givenOnTap,
    this.validator,
    this.minLin,
    this.maxLin,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscureText!,
      obscuringCharacter: obscureCharacter!,
      readOnly: isReadOnly!,
      onTap: () => givenOnTap?.call(),
      // Only set minLines and maxLines if not obscuring text
      minLines: isObscureText == true ? 1 : minLin,
      maxLines: isObscureText == true ? 1 : maxLin,
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
      ),
    );
  }
}
