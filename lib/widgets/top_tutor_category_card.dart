import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopTutorCategoryCard extends StatelessWidget {
  final String imgPath;
  final String name;
  final String title;
  final String rate;
  const TopTutorCategoryCard(
      {super.key,
      required this.imgPath,
      required this.name,
      required this.title,
      required this.rate});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Card(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: isDarkMode ? darkMode.cardColor : lightMode.cardColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        //color: Colors.red,
                      ),
                      child: ClipOval(
                        child: Image.asset(imgPath, fit: BoxFit.cover),
                      ),
                    ),
                    const Icon(CupertinoIcons.heart, size: 40),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Center(
                      child: Text(
                        rate,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
