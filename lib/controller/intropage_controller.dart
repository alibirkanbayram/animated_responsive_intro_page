import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/allprovider_shared.dart';

class IntroPageController {
  final WidgetRef ref;
  final int pageLength;
  final PageController pageController;
  int? durationTime = 500;

  IntroPageController({
    required this.ref,
    required this.pageLength,
    required this.pageController,
    this.durationTime,
  });

  // Update the intro page index
  void updatePageIndex(int index) {
    ref.read(introPageIndex.notifier).update((state) => index);
    pageController.animateToPage(
      index,
      duration: Duration(milliseconds: durationTime ?? 500),
      curve: Curves.ease,
    );
  }

  // Skip the last page
  void skipLastPage() {
    ref.read(introPageIndex.notifier).update((state) => pageLength);
    pageController.animateToPage(
      pageLength - 1,
      duration: Duration(milliseconds: durationTime ?? 500),
      curve: Curves.easeIn,
    );
  }
}
