import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edconnect/screens/home/student/student_chat.dart';
import 'package:edconnect/screens/home/student/student_forum.dart';
import 'package:edconnect/screens/home/student/student_homepage.dart';
import 'package:edconnect/screens/home/student/student_profile.dart';
import 'package:edconnect/theme/dark_mode.dart';
import 'package:edconnect/theme/light_mode.dart';
import 'package:edconnect/widgets/custom_rounded_search.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

  int index = 0;

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final pages = <Widget>[
      const Icon(Icons.home, size: 30),
      const Icon(Icons.message, size: 30),
      const Icon(Icons.menu_book, size: 30),
      const Icon(Icons.person, size: 30),
    ];

    final screens = [
      const StudentHomepage(),
      const StudentChat(),
      const StudentForum(),
      const StudentProfile(),
    ];

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBody: true,
      backgroundColor: isDarkMode
          ? darkMode.scaffoldBackgroundColor
          : lightMode.scaffoldBackgroundColor,
      appBar: AppBar(
        toolbarHeight: 75,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: RoundedSearchInput(
              textController: searchController,
              hintText: 'Search',
              newWidth: screenWidth,
            ),
          ),
          IconButton.outlined(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                  color: Colors.white, width: 2), // White outline
            ),
            onPressed: () {
              // Go to notifications page
            },
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
          const SizedBox(
            width: 21,
          )
        ],
      ),
      body: screens[index], // Display the current screen based on index
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          key: navigationKey,
          height: 60,
          items: pages,
          index: index,
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          backgroundColor: Colors.transparent,
          color: Theme.of(context).colorScheme.secondary,
          animationDuration: const Duration(milliseconds: 300),
          animationCurve: Curves.easeInOut,
        ),
      ),
    );
  }
}
