library animated_responsive_intro_page;

// Import other libs
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'controller/intropage_controller.dart';
import 'intropage_model.dart';
import 'shared/allprovider_shared.dart';
import 'widgets/generalbutton_widget.dart';

class AnimatedResponsiveIntroPage extends StatelessWidget {
  // Required parameters
  final List<IntroPageModel> introPageModelData;
  // -> Screen size
  final double height, width;
  // Optional parameters
  // -> Route to home page
  final Widget? routeHomePage;
  final String? routeHomePageRoute;
  final bool isPushNamed;
  // -> Other parameters definetion
  final String skipButtonText;
  final String getStartedButtonText;
  final ThemeData? themeData;
  final double generalPadding;
  final int duration;
  final Color containerColor, buttonColor, textColor;

  const AnimatedResponsiveIntroPage({
    required this.introPageModelData,
    // -> Screen size
    required this.height,
    required this.width,
    // Optional parameters
    // -> Route to home page
    this.routeHomePage,
    this.routeHomePageRoute,
    this.isPushNamed = false,
    // -> Other parameters definetion
    this.skipButtonText = "Skip",
    this.getStartedButtonText = "Get Started",
    this.themeData,
    this.generalPadding = 0.02,
    this.duration = 500,
    this.containerColor = Colors.white,
    this.buttonColor = Colors.white,
    this.textColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Consumer(
      builder: (context, ref, child) {
        IntroPageController introPageController = IntroPageController(
          ref: ref,
          pageLength: introPageModelData.length,
          pageController: pageController,
        );
        return SizedBox(
          height: height,
          width: width,
          child: Column(
            children: [
              for (int i = 0; i < 3; i++)
                i == 1
                    // SmoothPageIndicator
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * generalPadding,
                        ),
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: introPageModelData.length,
                          effect: const WormEffect(),
                          onDotClicked: (index) {
                            introPageController.updatePageIndex(index);
                          },
                        ),
                      )
                    // Image and Text
                    : Expanded(
                        flex: 5,
                        child: i == 0
                            // Image and Skip Button
                            ? Stack(
                                children: [
                                  Consumer(
                                    builder: (context, ref, child) {
                                      ref.watch(introPageIndex);
                                      return PageView(
                                        controller: pageController,
                                        onPageChanged: (index) {
                                          introPageController
                                              .updatePageIndex(index);
                                        },
                                        children: [
                                          for (int j = 0;
                                              j < introPageModelData.length;
                                              j++)
                                            Image.asset(
                                              introPageModelData[j].imageRoute,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall!
                                                  .color,
                                            )
                                        ],
                                      );
                                    },
                                  ),
                                  Positioned(
                                    top: height * generalPadding,
                                    right: width * generalPadding,
                                    child: i < introPageModelData.length - 1
                                        ? TextButton(
                                            onPressed: () {
                                              introPageController
                                                  .skipLastPage();
                                            },
                                            child: Text(
                                              skipButtonText,
                                              style: themeData == null
                                                  ? TextStyle(
                                                      fontSize: 20,
                                                      color: textColor,
                                                    )
                                                  : themeData!
                                                      .textTheme.bodyMedium,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ),
                                ],
                              )
                            // Container and Text
                            : Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * generalPadding,
                                  vertical: height * generalPadding,
                                ),
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    int index = ref.watch(introPageIndex);
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: containerColor,
                                        borderRadius: BorderRadius.circular(
                                          height * generalPadding,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              width * generalPadding * 2,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            for (int j = 0; j < 2; j++)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  top: j == 0
                                                      ? height * generalPadding
                                                      : 0,
                                                ),
                                                child: Text(
                                                  j == 0
                                                      ? introPageModelData[
                                                              index]
                                                          .title
                                                      : introPageModelData[
                                                              index]
                                                          .description,
                                                  style: j == 0
                                                      ? Theme.of(context)
                                                          .textTheme
                                                          .displayLarge
                                                      : Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: j == 0 ? 2 : 3,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            index ==
                                                    introPageModelData.length -
                                                        1
                                                ? GeneralButtonWidget(
                                                    height: height,
                                                    onPressed: () {
                                                      isPushNamed
                                                          ? Navigator.pushNamed(
                                                              context,
                                                              routeHomePageRoute!,
                                                            )
                                                          : Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        routeHomePage!,
                                                              ),
                                                            );
                                                    },
                                                    text: getStartedButtonText,
                                                    generalPadding:
                                                        generalPadding,
                                                    color: buttonColor,
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                      ),
            ],
          ),
        );
      },
    );
  }
}
