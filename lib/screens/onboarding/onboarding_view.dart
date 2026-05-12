import 'package:flutter/material.dart';
import '../../data/onboarding_data.dart';
import '../../utils/app_colors.dart';
import 'onboarding_screen.dart';

class OnboardingView extends StatelessWidget {
  final int initialPage;

  const OnboardingView({super.key, this.initialPage = 0});

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: initialPage);

    return Scaffold(
      backgroundColor: AppColors.background,

      body: PageView.builder(
        controller: controller,

        itemCount: onboardingData.length,

        itemBuilder: (context, index) {
          final data = onboardingData[index];

          return OnboardingScreen(
            image: data.image,
            title: data.title,
            description: data.description,
            currentIndex: index,
          );
        },
      ),
    );
  }
}
