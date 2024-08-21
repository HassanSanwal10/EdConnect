import 'package:edconnect/pages/login/login_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      imageFlex: 2,
      bodyFlex: 1,
      imageAlignment: Alignment.center,
      bodyAlignment: Alignment.topCenter,
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      imagePadding: EdgeInsets.only(top: 200),
      titlePadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    );
    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        allowImplicitScrolling: true,
        autoScrollDuration: null,
        infiniteAutoScroll: false,
        globalHeader: Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                'assets/images/logo_hd.png',
                height: 80,
              ),
            ),
            //Icon(Icons.school, size: 50, color: Colors.lightGreen),
          ),
        ),
        globalFooter: const SizedBox(height: 30),
        pages: [
          PageViewModel(
            title: "Learn anytime and anywhere",
            body:
                "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
            image: _buildImage('images/image1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Find a course for you",
            body:
                "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
            image: _buildImage('images/image2.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Improve your skills",
            body:
                "Quarantine is the perfect time to spend your day learning something new, from anywhere!",
            image: _buildImage('images/image3.png'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () => _onIntroEnd(context),
        onSkip: () => _onIntroEnd(context), // You can override onSkip callback
        showSkipButton: true,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: false,
        //rtl: true, // Display as right-to-left
        back: const Icon(Icons.arrow_back, color: Colors.green),
        skip: const Text('Skip',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green)),
        next: const Icon(Icons.arrow_forward, color: Colors.green),
        done: const Text('Done',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.green)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Colors.green,
          activeColor: Colors.lightGreenAccent,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          //color: Color.fromARGB(221, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
