import 'package:edconnect/widgets/custom_card_listview.dart';
import 'package:edconnect/widgets/todays_class_card.dart';
import 'package:edconnect/widgets/top_tutor_category_card.dart';
import 'package:edconnect/widgets/tutor_category_card.dart';
import 'package:flutter/material.dart';

class StudentHomepage extends StatelessWidget {
  const StudentHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> gradeItem = [
      '12th Std',
      '11th Std',
      '10th Std',
      '9th Std',
      'Secondary School',
    ];
    bool isTodayClass = true;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 10),
              if (isTodayClass == true) ...[
                _buildSectionTitle(context, "Today's Class"),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TodaysClassCard(
                          imgPath: 'assets/lottie/coding.json',
                          name: 'Coding',
                          time: '9 Minutes'),
                      TodaysClassCard(
                          imgPath: 'assets/lottie/math.json',
                          name: 'Math',
                          time: '2 Hours'),
                      TodaysClassCard(
                          imgPath: 'assets/lottie/urdu.json',
                          name: 'Urdu',
                          time: '5 Hours'),
                    ],
                  ),
                ),
              ],
              CardListWidget(items: gradeItem),
              _buildSectionTitle(context, 'Meet our Top Tutors'),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TopTutorCategoryCard(
                        imgPath: 'assets/images/goku.jpg',
                        name: "Walter White",
                        title: "Science Tutor",
                        rate: r"$40/hour"),
                    TopTutorCategoryCard(
                        imgPath: 'assets/images/goku.jpg',
                        name: "Adolf Hitler",
                        title: "Math Tutor",
                        rate: r"$40/hour"),
                    TopTutorCategoryCard(
                        imgPath: 'assets/images/goku.jpg',
                        name: "John Cena",
                        title: "English Tutor",
                        rate: r"$40/hour"),
                    TopTutorCategoryCard(
                        imgPath: 'assets/images/goku.jpg',
                        name: "Osama Bin Laden",
                        title: "Arabic Tutor",
                        rate: r"$40/hour"),
                  ],
                ),
              ),
              _buildSectionTitle(context, 'Meet our School Tutors'),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TutorCategoryCard(
                        title: "Class I to V",
                        subTitle: "Primary School",
                        imgPath: 'assets/images/primary.jpg'),
                    TutorCategoryCard(
                        title: 'Class V to VII',
                        subTitle: 'Seconday School',
                        imgPath: 'assets/images/secondary.png'),
                    TutorCategoryCard(
                        title: 'Class VIII to X',
                        subTitle: 'Higher Secondary School',
                        imgPath: 'assets/images/high.jpg'),
                  ],
                ),
              ),
              _buildSectionTitle(context, 'Meet our College Tutors'),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TutorCategoryCard(
                      title: "B.COM, B.B.A..",
                      subTitle: "Arts Students",
                      imgPath: 'assets/images/high.jpg',
                    ),
                    TutorCategoryCard(
                      title: 'F.Sc, F.A..',
                      subTitle: 'Science Students',
                      imgPath: 'assets/images/high.jpg',
                    ),
                    TutorCategoryCard(
                      title: 'B.Sc Engine..',
                      subTitle: 'Engineering Students',
                      imgPath: 'assets/images/high.jpg',
                    ),
                  ],
                ),
              ),
              _buildSectionTitle(context, 'Meet our Exam Tutors'),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TutorCategoryCard(
                      title: "Mathematics Tutor",
                      subTitle: "Algebra and Geometry",
                      imgPath: 'assets/images/high.jpg',
                    ),
                    TutorCategoryCard(
                      title: "Science Tutor",
                      subTitle: "Phy, Chem, & Bio",
                      imgPath: 'assets/images/high.jpg',
                    ),
                    TutorCategoryCard(
                      title: "English Tutor",
                      subTitle: "Literature and Grammar",
                      imgPath: 'assets/images/high.jpg',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: () {},
          child: const Text("See all"),
        ),
      ],
    );
  }
}
