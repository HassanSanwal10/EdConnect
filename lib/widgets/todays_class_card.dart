import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TodaysClassCard extends StatelessWidget {
  final String imgPath;
  final String name;
  final String time;
  const TodaysClassCard(
      {super.key,
      required this.imgPath,
      required this.name,
      required this.time});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
      child: Card(
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: isDarkMode ? darkMode.cardColor : lightMode.cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Flexible(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: SizedBox.expand(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Lottie.asset(
                        imgPath,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                  child: SizedBox.expand(
                      child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.redAccent,
                          size: 10,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Class in $time",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  )),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  child: SizedBox.expand(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Text(
                        'Class: $name',
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
