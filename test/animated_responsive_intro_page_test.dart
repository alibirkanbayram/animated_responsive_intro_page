import 'package:animated_responsive_intro_page/animated_responsive_intro_page.dart';
import 'package:animated_responsive_intro_page/intropage_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Animated Responsive Intro Page',
      home: Scaffold(
        body: SafeArea(
          child: AnimatedResponsiveIntroPage(
            introPageModelData: [
              IntroPageModel(
                title: 'Title 1',
                description: 'Description 1',
                imageRoute: 'assets/image1.png',
              ),
              IntroPageModel(
                title: 'Title 2',
                description: 'Description 2',
                imageRoute: 'assets/image2.png',
              ),
              IntroPageModel(
                title: 'Title 3',
                description: 'Description 3',
                imageRoute: 'assets/image3.png',
              ),
            ],
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }
}
