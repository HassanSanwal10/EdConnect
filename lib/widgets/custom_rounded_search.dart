import 'package:flutter/material.dart';

class RoundedSearchInput extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double newWidth;
  const RoundedSearchInput(
      {required this.textController,
      required this.hintText,
      super.key,
      required this.newWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: newWidth * 0.75,
      height: 45,
      child: TextField(
        controller: textController,
        onChanged: (value) {},
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[500]!,
          ),
          filled: true,
          //fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w300,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
            borderRadius: const BorderRadius.all(Radius.circular(45.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(45.0)),
          ),
        ),
      ),
    );
  }
}
