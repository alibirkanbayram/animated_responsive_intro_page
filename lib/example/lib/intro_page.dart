import 'package:animated_responsive_intro_page/animated_responsive_intro_page.dart';
import 'package:animated_responsive_intro_page/intropage_model.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double height = mediaQuery.size.height;
    double width = mediaQuery.size.width;
    return Scaffold(
      body: AnimatedResponsiveIntroPage(
        height: height,
        width: width,
        introPageModelData: [
          IntroPageModel(
            title: 'Welcome to the App',
            description:
                'This is a simple app that shows how to create an animated responsive intro page in Flutter.',
            imageRoute: 'assets/images/intropage1.png',
          ),
          IntroPageModel(
            title: 'Responsive Design',
            description: 'The app is responsive and works on all screen sizes.',
            imageRoute: 'assets/images/intropage2.png',
          ),
          IntroPageModel(
            title: 'Animated Intro Page',
            description: 'The intro page is animated and looks great.',
            imageRoute: 'assets/images/intropage3.png',
          ),
        ],
        routeHomePage: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text('This is the home page.'),
      ),
    );
  }
}
